/// @description scr_hitbox_hurt_act(o_hitbox, o_actor, number, number, number)
/// @param hitbox_id
/// @param actor_hurting
/// @param health_lost
/// @param x_knockaway
/// @param stuntime

/*
Actors can only be hurt if they have a hurt state. Health is stored in the state,
not the actor. 
*/

var ID = argument[0];
var hitID = argument[1];
var damage = argument[2];
var x_knockaway = argument[3];
var stuntime = argument[4];

if (hitID.v_act_state_hurt != undefined) {
	// first check if the hit actor already has the offending object in its hitboxes list
	var hitboxfound = false;
	for (var i = 0; i < ds_list_size(hitID.v_act_hitboxes_struck); i++) {
		if (ID == ds_list_find_value(hitID.v_act_hitboxes_struck, i)) {
			hitboxfound = true;
			i = ds_list_size(hitID.v_act_hitboxes_struck);
		}
	}
	
	// if the offending object is not in the list, then this is a true hit.
	if (!hitboxfound) {
		var hurt = hitID.v_act_state_hurt;
		hurt.v_state_hurt_stage = enum_hurt_stage.stun;
		hitID.v_act_state_cur = hurt;
		
		hurt.v_state_count = stuntime;
		hurt.v_state_hurt_health -= damage;
		
		if (hurt.v_state_hurt_health > 0) {
			if (ID.v_hitbox_hitter != undefined && ID.v_hitbox_freezehitter) ID.v_hitbox_hitter.v_act_freezetime = stuntime;
		
			scr_state_changesprite(hitID);
			if (ID.v_hitbox_snd_miss != undefined) audio_stop_sound(ID.v_hitbox_snd_miss);
			if (ID.v_hitbox_snd_hit != undefined) scr_playsfx(ID.v_hitbox_snd_hit);
			if (ID.v_hitbox_effect != undefined) instance_create_layer(hitID.x, hitID.y, "Hitboxes", ID.v_hitbox_effect);
			ds_list_add(hitID.v_act_hitboxes_struck, ID);
			if (hurt.v_state_sound != undefined) scr_playsfx(hurt.v_state_sound);
		
			if (object_is_ancestor(hitID.v_act_state_cur.object_index, o_state_ladder)) {
				// ladders need special code because of walls.
				hurt.v_state_hurt_ladder = true;
				hurt.v_state_hurt_vel_x = 0;
				hurt.v_state_hurt_vel_y = 0;
			} else {
				hurt.v_state_hurt_ladder = false;
				/*
				Something to note; it's ok if we just blindly assign velocities to
				the actor because we are in the end step. The script_run for the hurt actor
				will not run until the step event of the next frame. And it's only after that
				script is run that the actor is actually moved. So we can check for walls and
				whatever in the run script of the state. 
				*/
				hurt.v_state_hurt_vel_y = hurt.v_state_hurt_knock_y;
				if (hitID.x > x_knockaway) hurt.v_state_hurt_vel_x = hurt.v_state_hurt_knock_x;
				if (hitID.x < x_knockaway) hurt.v_state_hurt_vel_x = hurt.v_state_hurt_knock_x * -1;
				if (hitID.x == x_knockaway) {
					if (irandom_range(0, 1) == 1) hurt.v_state_hurt_vel_x = hurt.v_state_hurt_knock_x;
					else hurt.v_state_hurt_vel_x = hurt.v_state_hurt_knock_x * -1;
				}
			}
		} else {
			if (hitID.v_act_dead_scene == undefined) {
				// We're assuming the scene will take control if it's defined
				if (hitID.v_act_dead_fx != undefined) instance_create_layer(x, y, "Hitboxes", hitID.v_act_dead_fx);
				if (hitID.v_act_hitbox != undefined) instance_destroy(hitID.v_act_hitbox);
				instance_destroy(hitID);
			}
		}
	} else if (ID.v_hitbox_firstcheck) scr_playsfx(ID.v_hitbox_snd_miss);
}
