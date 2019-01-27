/// @description Insert description here
// You can write your code in this editor
if (!global.freezeactors) {
	var new_vel_x = 0
	var new_vel_y = 0;
	
	#region //check for hit and hitbox deletion
	for (i = 0; i < ds_list_size(v_fireball_hitboxes_struck); i++) {
		var hitboxid = ds_list_find_value(v_fireball_hitboxes_struck, i);
		var hitboxfound = false;
		for (j = 0; j < instance_number(o_hitbox_plr); j++) {
			var instanceid = instance_find(o_hitbox_plr, j);
			if (hitboxid == instanceid) hitboxfound = true;
		}
		if (!hitboxfound) {
			ds_list_delete(v_fireball_hitboxes_struck, i);
			i--;
		}
	}
	
	if (place_meeting(x, y, o_hitbox_plr)) {// && (v_fireball_state != enum_fireball_state.hit)
		var hitboxid = instance_place(x, y, o_hitbox_plr);
		var newhitbox = true;
		for (i = 0; i < ds_list_size(v_fireball_hitboxes_struck); i++) {
			var valueid = ds_list_find_value(v_fireball_hitboxes_struck, i)
			if (hitboxid == valueid) newhitbox = false;
		}
		if (newhitbox) {
			v_fireball_state = enum_fireball_state.hit;
			v_fireball_stuntime = v_fireball_stuntime_max;
			ds_list_add(v_fireball_hitboxes_struck, hitboxid);
			image_speed = 0;
			v_fireball_health -= global.player_sword_dmg;
			if (v_fireball_health <= 0) {
				audio_stop_sound(snd_emy_explosion);
				scr_playsfx(snd_emy_explosion);
				instance_destroy(id);
				instance_create_layer(x, y + v_act_explosion_y_offset, "Enemies", o_emy_explosion);
				exit;
			} else {
				audio_stop_sound(snd_hit_sword);
				scr_playsfx(snd_hit_sword);
				instance_create_layer(x, y, "Hitboxes", o_hit_effect);
			}
		}
	}
	#endregion
	
	switch (v_fireball_state) {
		case enum_fireball_state.moving:
		new_vel_x = v_act_vel_runaccel;
		if (!v_act_faceright) new_vel_x = v_act_vel_runaccel * -1;
		image_speed = 1;
		
		//first we are going to detect ledges
		var x_diff = scr_act_potxpos(id, new_vel_x) - x;
			
		if (v_act_faceright) {
			if (!position_meeting(bbox_right + x_diff, bbox_bottom + 1, o_wall)) {
				new_vel_x = 0;
				v_act_faceright = false;
				//sprite_index = s_emy_slug_gnd_idle_left;
			}
		} else {
			if (!position_meeting(bbox_left + x_diff, bbox_bottom + 1, o_wall)) {
				new_vel_x = 0;
				v_act_faceright = true;
				//sprite_index = s_emy_slug_gnd_idle;
			}
		}
		
		if (place_meeting(scr_act_potxpos(id, new_vel_x), y, o_wall)) {
			new_vel_x = scr_obj_approachdist_x_at_y_against_obj(id, new_vel_x, y, o_wall);
			if (v_act_faceright) v_act_faceright = false;
			else v_act_faceright = true;
		}
		break;
		case enum_fireball_state.hit:
		if (v_fireball_stuntime > 0) v_fireball_stuntime--;
		else {
			v_fireball_state = enum_fireball_state.moving;
			image_speed = 1;
		}
		break;
	}
	v_act_faceright_prev = v_act_faceright;
	v_act_vel_x = new_vel_x;
	v_act_vel_y = new_vel_y;
	event_inherited();
} else image_speed = 0;