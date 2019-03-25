/// @description 

if (global.transition_state != enum_transition_state.off) {
	global.v_wsmenu_control = false;
	switch (v_transition_type) {
		case enum_transition_type.blink:
			if (global.transition_state == enum_transition_state.intro) v_transition_percent = max(0, v_transition_percent - max(v_transition_percent/10), 0.005);
			else v_transition_percent = min(v_transition_blinkamount, v_transition_percent + max(((v_transition_blinkamount - v_transition_percent)/10), 0.005));
			break;
		case enum_transition_type.fade:
			if (global.transition_state == enum_transition_state.intro) v_transition_percent -= v_transition_faderate;
			else v_transition_percent += v_transition_faderate;
			break;
		case enum_transition_type.stepfade:
			if (global.transition_state == enum_transition_state.intro) v_transition_percent -= v_transition_faderate;
			else v_transition_percent += v_transition_faderate;
			break;
	}
	if (v_transition_percent >= 1.3) || (v_transition_percent <= 0) {//done with transition, choose next transition state based of current one
		switch (global.transition_state) {
			case enum_transition_state.intro:
				global.transition_state = enum_transition_state.off;
				global.v_menu_control = true;
				o_pausemenu.v_pausemenu_control = true;
				//here, we can make projectiles visible again,
				//after the player object made them invisible for the death screen
				layer_set_visible("Projectiles", true);
				break;
			case enum_transition_state.next:
				room_goto_next();
				global.transition_state = enum_transition_state.intro;
				break;
			case enum_transition_state.goto:
				room_goto(v_transition_target);
				global.pauseactive = false;
				global.transition_state = enum_transition_state.intro;
				global.cursor_committed = global.novalue;
				break;
			case enum_transition_state.restart:
				game_restart();
				break;
		}
	}
}