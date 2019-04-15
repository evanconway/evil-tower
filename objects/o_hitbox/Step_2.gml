/// @description Detect Collisions With Target

if (v_hitbox_target != undefined && instance_exists(v_hitbox_target) && place_meeting(x, y, v_hitbox_target)) {
	
	// need list so hitboxes can hit more than one actor at once
	var actors_hit = ds_list_create();
	instance_place_list(x, y, v_hitbox_target, actors_hit, false);
	
	for (var i = 0; i < ds_list_size(actors_hit); i++) {
		var actor = actors_hit[|i];
		
		// only continue if the actor does not already contain the hitbox
		if (ds_list_find_index(actor.v_act_hitboxes_struck, id) < 0) {
			
			// the hitbox is new to them, and this is a true hit
			ds_list_add(actor.v_act_hitboxes_struck, id);
			var hurt = actor.v_act_state_hurt;
			hurt.v_state_hurt_health -= v_hitbox_damage;
			
			if (hurt.v_state_hurt_health > 0) {
				actor.v_act_freezetime = v_hitbox_stun;
				actor.v_act_shadertime = v_hitbox_stun;
				actor.v_act_shader = v_hitbox_shader;
				if (v_hitbox_freezehitter && instance_exists(v_hitbox_hitter)) v_hitbox_hitter.v_act_freezetime = v_hitbox_stun;
				hurt.v_state_count = hurt.v_state_count_max;
				
				if (v_hitbox_fx != undefined) instance_create_layer(actor.x, actor.y - hurt.v_state_hurt_fx_yoffset, "Projectiles", v_hitbox_fx);
				if (v_hitbox_snd_hit != undefined) scr_playsfx(v_hitbox_snd_hit);
				if (hurt.v_state_hurt_fx != undefined) instance_create_layer(actor.x, actor.y - hurt.v_state_hurt_fx_yoffset, "Projectiles", hurt.v_state_hurt_fx);
				if (hurt.v_state_hurt_snd != undefined) scr_playsfx(hurt.v_state_hurt_snd);
				
				if (actor.v_act_state_cur != undefined && object_is_ancestor(actor.v_act_state_cur.object_index, o_state_ladder)) {
					hurt.v_state_hurt_ladder = true;
					hurt.v_state_hurt_vel_x = 0;
					hurt.v_state_hurt_vel_y = 0;
				} else {
					hurt.v_state_hurt_ladder = false;
					hurt.v_state_hurt_vel_x = v_hitbox_knock_x;
					if (instance_exists(v_hitbox_hitter) && v_hitbox_hitter.x > actor.x) hurt.v_state_hurt_vel_x *= -1;
					hurt.v_state_hurt_vel_y = v_hitbox_knock_y;
				}
				if (v_hitbox_destroyonhit) instance_destroy(id);
				actor.v_act_state_cur = hurt;
			} else if (hurt.v_state_hurt_dead_scene == undefined) {
				// we won't bother creating death effects if there is a death scene, we'll assume that handles everything
				if (hurt.v_state_hurt_dead_fx != undefined) instance_create_layer(actor.x, actor.y, "Projectiles", hurt.v_state_hurt_dead_fx);
				if (hurt.v_state_hurt_dead_snd != undefined) scr_playsfx(hurt.v_state_hurt_dead_snd);
				ds_list_add(global.enemies_slain, actor);
				instance_destroy(actor);
			}
		}
	}
	
	ds_list_destroy(actors_hit);
} else if (v_hitbox_firstcheck) scr_playsfx(v_hitbox_snd_miss);

v_hitbox_firstcheck = false;

if (!v_hitbox_permenant) {
	v_hitbox_time--;
	if (v_hitbox_time <= 0) instance_destroy(id);
}

if (v_hitbox_wallends && place_meeting(x, y, o_wall)) {
	if (v_hitbox_fx != undefined) instance_create_layer(x, y, "Hitboxes", v_hitbox_fx);
	if (v_hitbox_snd_hit != undefined) scr_playsfx(v_hitbox_snd_hit);
	instance_destroy(id);
}
