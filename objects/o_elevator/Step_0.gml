/// @description Insert description here

if (v_elevator_playerentered) {	
	switch (v_elevator_type) {
		case enum_elevator_type.lvl_start:
		switch (v_elevator_state) {
			case enum_elevator_state.entering:
			v_elevator_state = enum_elevator_state.moving;//should be "entering" if it's a start elevator
			//break; no break so we can go straight to moving
			case enum_elevator_state.moving:
			if (!audio_is_playing(snd_elevator_mv)) scr_playsfx(snd_elevator_mv, true);
			if (scr_act_potypos(id, v_elevator_vel) >= v_elevator_end_y) v_act_vel_y = v_elevator_vel;
			else {
				v_act_vel_y = y - v_elevator_end_y;
				audio_stop_sound(snd_elevator_mv);
				scr_playsfx(snd_elevator_stp, false);
				v_elevator_timer = v_elevator_doordelay
				v_elevator_state = enum_elevator_state.leaving;
			}
			break;
			case enum_elevator_state.leaving:
			if (v_elevator_timer > 0) {
				v_elevator_timer--;
				if (v_elevator_timer <= 0) scr_playsfx(snd_elevator_opn, false);
			} else {
				image_speed = -1;
				if (floor(image_index) == 0) {
					v_elevator_playerentered = false;
					scr_plr_setstate(o_player, enum_plr_state.gnd_idle, s_plr_gnd_static);
					image_speed = 0;
					o_player.depth = v_elevator_plrdepth;
					o_camera.v_camera_follow = o_player;
					global.elevator_active = false;
				}
			}
			break;
		}
		break;
		case enum_elevator_type.lvl_end:
		switch(v_elevator_state) {
			case enum_elevator_state.entering:
			global.elevator_active = true;
			if (audio_is_playing(o_music.v_music_currenttrack)) audio_stop_sound(o_music.v_music_currenttrack);
			if (image_index == 0) {
				if (v_elevator_timer > 0) {
					o_player.sprite_index = s_plr_gnd_static_back;
					v_elevator_timer--;
				} else {
					o_player.sprite_index = s_plr_gnd_static;
					o_player.depth = v_elevator_plrdepth_adj;
					image_speed = 1;
					scr_playsfx(snd_elevator_opn);
				}
			} else if (floor(image_index) == sprite_get_number(s_elevator) - 1) {
				image_speed = 0;
				v_elevator_timer = v_elevator_liftdelay;
				v_elevator_state = enum_elevator_state.moving;
			}
			break;
			case enum_elevator_state.moving:
			o_camera.v_camera_follow = global.novalue;
			if (v_elevator_timer > 0) v_elevator_timer--
			else {
				if (!audio_is_playing(snd_elevator_mv)) scr_playsfx(snd_elevator_mv, true);
				if (scr_act_potypos(id, v_elevator_vel) >= v_elevator_end_y) v_act_vel_y = v_elevator_vel;
				else {
					audio_stop_sound(snd_elevator_mv);
					v_act_vel_y = y - v_elevator_end_y;
					v_elevator_state = enum_elevator_state.leaving;
				}
			}
			break;
			case enum_elevator_state.leaving:
			scr_transition(enum_transition_state.goto, v_elevator_target_room);
			break;
		}
		break;
		case enum_elevator_type.move:
		break;
	}
}
if (!global.pauseactive) event_inherited();
if (v_elevator_playerentered) {
	o_player.x = x;
	o_player.y = y + v_elevator_playeroffset;	
}