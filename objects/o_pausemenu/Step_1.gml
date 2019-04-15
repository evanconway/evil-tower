/// @description Insert description here

/*
Player can't pause when room is 4 and below because that's the main menu and intro sections
of the game. You can't pause if the pause menu doesn't have control (like when you're in 
other menus). And you can't pause during transitions. At some point we should change this
so that you can pause during most transitions, just not the ones where it doesn't make 
sense (like the fade back to the main menu).
*/

if (room > 4 && v_pausemenu_control && !instance_exists(o_transition_fade_nopause)) {
	global.canpause = true;
} else {
	global.canpause = false;
}

if (global.pauseactive) {
	global.freezescenes = true;
	global.freezeactors = true;
	if (v_pausemenu_control) {
		if (scr_input_ui_check(enum_input.up)) {
			scr_playsfx(snd_UI1); // v_pausemenu_commit_snd = snd_UI1;
			v_pausemenu_cursor++;
			if (v_pausemenu_cursor >= v_pausemenu_items) v_pausemenu_cursor = 0;
		}
		if (scr_input_ui_check(enum_input.down)) {
			scr_playsfx(snd_UI1); // v_pausemenu_commit_snd = snd_UI1;
			v_pausemenu_cursor--;
			if (v_pausemenu_cursor < 0) v_pausemenu_cursor = v_pausemenu_items - 1;
		}
		if (scr_input_ui_check(enum_input.select)) {
			v_pausemenu_commit_snd = snd_select;
			v_pausemenu_committed = v_pausemenu_cursor;
			v_pausemenu_control = false;
		}
		if (scr_input_ui_check(enum_input.cancel) || scr_input_ui_check(enum_input.start)) {
			v_pausemenu_unpause = true;
			v_pausemenu_commit_snd = snd_UIBack;
		}
	}
	
	if (v_pausemenu_committed != undefined) {
		switch (v_pausemenu_committed) {
			case 0://quit
			game_end();
			break;
			case 1://main menu
			v_pausemenu_unpause = true;
			if (instance_exists(o_transition)) {
				instance_destroy(o_transition);
				audio_stop_all();
			}
			v_pausemenu_commit_snd = snd_success;
			scr_transition_fade_nopause(main_menu);
			break;
			case 2://options
			global.optionsactive = true;
			o_optionsmenu.v_optionsmenu_control = true;
			v_pausemenu_control = false;
			/*
			This is some weird jank because "button pressed" inputs remain 
			true in different objects step events.
			*/
			v_pausemenu_committed = 4;
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
		if (v_pausemenu_commit_snd != undefined) {
			scr_playsfx(v_pausemenu_commit_snd);
			v_pausemenu_commit_snd = undefined;
		} else v_pausemenu_commit_snd = undefined;
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
