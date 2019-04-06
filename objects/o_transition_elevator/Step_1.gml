/// @description 

global.freezeactors = true;

switch (v_transition_stage) {
	case 0:
	// first, fade to color
	if (v_transition_alpha != 1) {
		v_transition_count--;
		if (v_transition_count <= 0) {
			v_transition_count = v_transition_rate;
			v_transition_alpha += v_transition_change;
			if (v_transition_alpha >= 1) {
				v_transition_alpha = 1;
				v_transition_color = v_transition_color2;
				room_goto(v_transition_targetroom);
			}
		}
	} else if (room == v_transition_targetroom) {
		v_transition_stage++;
		// now that we're in the correct room, we can move the elevator to its start position
		// setup camera correctly
		scr_set_camera_pos(v_transition_elevator.x, v_transition_elevator.y - o_camera.v_camera_boundary_y);
		o_camera.v_camera_follow = undefined;
		v_transition_elevator.y += v_transition_elevator.v_elevator_start_y;
		v_transition_plrdepth = o_player.depth;
		o_player.depth = v_transition_elevator.depth + 1;
		o_player.sprite_index = v_transition_sprite2;
		scr_playsfx(snd_elevator_mv, true);
	}
	break;
	case 1:
	// then, simultaneously fade from color and move elevator
	// fade
	if (v_transition_alpha > 0) {
		v_transition_count --;
		if (v_transition_count <= 0) {
			v_transition_count = v_transition_rate;
			v_transition_alpha -= v_transition_change;
			if (v_transition_alpha <= 0) v_transition_alpha = 0;
		}
	}
	// move elevator
	if (v_transition_elevator.y != v_transition_elevator.v_elevator_target_y) {
		v_transition_elevator.y -= v_transition_elevator.v_elevator_speed;
		if (v_transition_elevator.y <= v_transition_elevator.v_elevator_target_y) {
			v_transition_elevator.y = v_transition_elevator.v_elevator_target_y;
			audio_stop_sound(snd_elevator_mv);
			scr_playsfx(snd_elevator_stp);
		}
		scr_act_setpos(o_player, floor(v_transition_elevator.x), floor(v_transition_elevator.y));
	}
	if (v_transition_elevator.y == v_transition_elevator.v_elevator_target_y && v_transition_alpha == 0) {
		v_transition_stage++;
		v_transition_count = v_transition_opendelay;
	}
	break;
	case 2:
	v_transition_count--;
	if (v_transition_count <= 0) {
		v_transition_elevator.image_speed = -1;
		scr_playsfx(snd_elevator_opn);
		v_transition_stage++;
	}
	break;
	case 3:
	if (v_transition_elevator.image_index <= 0) {
		v_transition_elevator.image_speed = 0;
		o_player.depth = v_transition_plrdepth;
		global.freezeactors = false;
		o_camera.v_camera_follow = o_player;
		instance_destroy(id);
	}
	break;
}

