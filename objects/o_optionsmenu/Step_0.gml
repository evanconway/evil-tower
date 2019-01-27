/// @description Insert description here

if (global.optionsactive) {
	if (v_optionsmenu_control) {
		if (scr_input_ui_check(enum_input.up)) {
			scr_playsfx(snd_UI1);
			v_optionsmenu_cursor++;
			if (v_optionsmenu_cursor >= v_optionsmenu_items) v_optionsmenu_cursor = 0;
		}
		if (scr_input_ui_check(enum_input.down)) {
			scr_playsfx(snd_UI1);
			v_optionsmenu_cursor--;
			if (v_optionsmenu_cursor < 0) v_optionsmenu_cursor = v_optionsmenu_items - 1;
		}
		if (scr_input_ui_check(enum_input.select)) {
			scr_playsfx(snd_select);
			v_optionsmenu_committed = v_optionsmenu_cursor;
			v_optionsmenu_control = false;
		}
		if (scr_input_ui_check(enum_input.cancel)) {
			scr_playsfx(snd_UIBack);
			global.optionsactive = false;
			v_optionsmenu_committed = global.novalue;
			v_optionsmenu_cursor = 3;
		}
	}
	if (v_optionsmenu_committed != global.novalue) {
		switch (v_optionsmenu_committed) {
			case 0://back
			global.optionsactive = false;
			v_optionsmenu_committed = global.novalue;
			v_optionsmenu_cursor = 3;
			break;
			case 1://Sound
			v_optionsmenu_committed = 5;
			o_soundmenu.v_soundmenu_control = true;
			v_optionsmenu_control = false;
			global.soundmenuactive = true;
			break;
			case 2://Screen
			v_optionsmenu_committed = 6;
			o_screenmenu.v_screenmenu_control = true;
			v_optionsmenu_control = false;
			global.screenmenuactive = true;
			break;
			case 3://controls
			v_optionsmenu_committed = 4;
			o_controlsmenu.v_controlsmenu_control = true;
			v_optionsmenu_control = false;
			global.controlsactive = true;
			break;
			case 4://while controls is open
			if (!global.controlsactive)  {
				v_optionsmenu_control = true;
				v_optionsmenu_committed = global.novalue;
			}
			break;
			case 5:
			if (!global.soundmenuactive) {
				v_optionsmenu_control = true;
				v_optionsmenu_committed = global.novalue;
			}
			break;
			case 6:
			if (!global.screenmenuactive) {
				v_optionsmenu_control = true;
				v_optionsmenu_committed = global.novalue;
			}
			break;
		}
	}
}