/// @description Insert description here

if (room > 3 && !instance_exists(o_transition) && v_pausemenu_control) {
	global.canpause = true;
} else {
	global.canpause = false;
}

if (global.pauseactive) {
	global.freezeactors = true;
	if (v_pausemenu_control) {
		if (scr_input_ui_check(enum_input.up)) {
			scr_playsfx(snd_UI1);
			v_pausemenu_cursor++;
			if (v_pausemenu_cursor >= v_pausemenu_items) v_pausemenu_cursor = 0;
		}
		if (scr_input_ui_check(enum_input.down)) {
			scr_playsfx(snd_UI1);
			v_pausemenu_cursor--;
			if (v_pausemenu_cursor < 0) v_pausemenu_cursor = v_pausemenu_items - 1;
		}
		if (scr_input_ui_check(enum_input.select)) {
			if (v_pausemenu_cursor == 1) scr_playsfx(snd_success); //main menu
			else scr_playsfx(snd_select);
			v_pausemenu_committed = v_pausemenu_cursor;
			v_pausemenu_control = false;
		}
		if (scr_input_ui_check(enum_input.cancel) || scr_input_ui_check(enum_input.start)) {
			v_pausemenu_unpause = true;
		}
	}
	
	if (v_pausemenu_committed != global.novalue) {
		switch (v_pausemenu_committed) {
			case 0://quit
			game_end();
			break;
			case 1://main menu
			v_pausemenu_unpause = true;
			scr_transition_fade(main_menu);
			break;
			case 2://options
			global.optionsactive = true;
			o_optionsmenu.v_optionsmenu_control = true;
			v_pausemenu_control = false;
			v_pausemenu_committed = 4;//this is some weird jank because "button pressed" inputs remain true in different objects step events.
			break;
			case 3://return to game
			v_pausemenu_unpause = true;
			break;
			case 4://while options is open
			if (!global.optionsactive) {
				v_pausemenu_control = true;
				v_pausemenu_committed = global.novalue;
			}
			break;
		}
	}
} else {
	if (scr_input_check(true, enum_input.start) && global.canpause) {
		audio_pause_all();
		if (o_music.v_music_currenttrack != undefined) audio_resume_sound(o_music.v_music_currenttrack);
		scr_playsfx(snd_pause);
		global.pauseactive = true;
		v_pausemenu_control = true;
		v_pausemenu_cursor = 3;
	}
}
