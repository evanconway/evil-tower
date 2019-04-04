event_inherited();

// OLD, not sure what we'll take from here.
/*
if (!global.freezeactors) {
	image_speed = 1;
	var new_vel_x = 0
	var new_vel_y = 0;
	
	#region //check for hit and hitbox deletion
	for (i = 0; i < ds_list_size(v_act_hitboxes_struck); i++) {
		var hitboxid = ds_list_find_value(v_act_hitboxes_struck, i);
		var hitboxfound = false;
		for (j = 0; j < instance_number(o_hitbox_plr); j++) {
			var instanceid = instance_find(o_hitbox_plr, j);
			if (hitboxid == instanceid) hitboxfound = true;
		}
		if (!hitboxfound) {//if the hitbox does not exist, remove from list of hitboxes that have struck actor
			ds_list_delete(v_act_hitboxes_struck, i);
			i--;
		}
	}
	
	if (place_meeting(x, y, o_hitbox_plr)) {// && (v_act_state != enum_zombie_state.hit)
		var hitboxid = instance_place(x, y, o_hitbox_plr);
		var newhitbox = true;
		for (i = 0; i < ds_list_size(v_act_hitboxes_struck); i++) {
			var valueid = ds_list_find_value(v_act_hitboxes_struck, i)
			if (hitboxid == valueid) newhitbox = false;
		}
		if (newhitbox) {
			v_act_state_beforehit = v_act_state;
			v_act_state = enum_zombie_state.hit;
			v_zombie_stuntime = v_zombie_stuntime_max;
			ds_list_add(v_act_hitboxes_struck, hitboxid);
			image_speed = 0;
			v_act_health -= global.player_sword_dmg;
			if (v_act_health <= 0) {
				audio_stop_sound(snd_emy_explosion);
				scr_playsfx(snd_emy_explosion);
				instance_destroy(id);
				instance_create_layer(x, y + v_act_explosion_y_offset, "Enemies", o_emy_explosion);
				exit;
			} else {
				audio_stop_sound(snd_hit_sword)
				scr_playsfx(snd_hit_sword);
				instance_create_layer(x, y, "Hitboxes", o_hit_effect);
			}
		}
	}
	#endregion
	
	switch (v_act_state) {
		case enum_zombie_state.idle:
		if (v_act_statetime > 0) v_act_statetime--
		else {
			v_act_statetime = irandom_range(v_zombie_time_min, v_zombie_time_max);
			v_act_state = irandom_range(0, 1);
			//add variety to zombies
			var temp_sprite_num = 0;
			if (v_act_state = enum_zombie_state.hit) temp_sprite_num = irandom_range(0, 1);
			switch(temp_sprite_num) {
				case enum_zombie_idlesprite.face:
				v_zombie_idle_sprite = s_emy_zombie_gnd_static;
				break;
				case enum_zombie_idlesprite.side:
				if (v_act_faceright) v_zombie_idle_sprite = s_emy_zombie_gnd_idle;
				else v_zombie_idle_sprite = s_emy_zombie_gnd_idle_left;
				break;
			}
			
			v_act_faceright = v_act_state = irandom_range(0, 1);
			switch(v_act_state) {
				case enum_zombie_state.idle:
				if (v_act_faceright) sprite_index = v_zombie_idle_sprite;
				else v_zombie_idle_sprite = s_emy_zombie_gnd_idle_left;
				image_speed = 1;
				break;
				case enum_zombie_state.moving:
				if (v_act_faceright) sprite_index = s_emy_zombie_gnd_walk;
				else sprite_index = s_emy_zombie_gnd_walk_left;
				image_speed = 1;
				break;
			}
		}
		break;
		case enum_zombie_state.moving:
		if (v_act_statetime > 0) {
			v_act_statetime--
			new_vel_x = v_act_vel_x_max;
			if (!v_act_faceright) new_vel_x = new_vel_x * -1;
			//first we are going to detect ledges
			var x_diff = scr_act_potxpos(id, new_vel_x) - x;
			if (v_act_faceright) {
				if (!position_meeting(bbox_right + x_diff, bbox_bottom + 1, o_wall)) {
					new_vel_x = 0;
					v_act_faceright = false;
					sprite_index = s_emy_zombie_gnd_walk_left;
				}
			} else {
				if (!position_meeting(bbox_left + x_diff, bbox_bottom + 1, o_wall)) {
					new_vel_x = 0;
					v_act_faceright = true;
					sprite_index = s_emy_zombie_gnd_walk;
				}
			}		
			//now detect walls
			if (place_meeting(scr_act_potxpos(id, new_vel_x), y, o_wall)) {
				//fix approachdist later
				new_vel_x = scr_obj_approachdist_x_at_y_against_obj(id, new_vel_x, y, o_wall);
				if (v_act_faceright) {
					v_act_faceright = false;
					sprite_index = s_emy_zombie_gnd_walk_left;
				} else {
					v_act_faceright = true;
					sprite_index = s_emy_zombie_gnd_walk;
				}
			}
		} else {
			v_act_statetime = irandom_range(v_zombie_time_min, v_zombie_time_max);
			v_act_state = irandom_range(0, 1);
			v_act_faceright = v_act_state = irandom_range(0, 1);
			switch(v_act_state) {
				case enum_zombie_state.idle:
				if (v_act_faceright) sprite_index = s_emy_zombie_gnd_idle;
				else sprite_index = s_emy_zombie_gnd_idle_left;
				image_speed = 1;
				break;
				case enum_zombie_state.moving:
				if (v_act_faceright) sprite_index = s_emy_zombie_gnd_walk;
				else sprite_index = s_emy_zombie_gnd_walk_left;
				image_speed = 1;
				break;
			}
		}
		break;
		case enum_zombie_state.hit:
		if (v_zombie_stuntime > 0) v_zombie_stuntime--;
		else {
			v_act_state = v_act_state_beforehit;
			image_speed = 1;
		}
		break;
	}
	v_act_faceright_prev = v_act_faceright;
	v_act_vel_x = new_vel_x;
	v_act_vel_y = new_vel_y;
	event_inherited();
} else image_speed = 0;
*/
