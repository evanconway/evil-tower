/// @description Insert description here

if (global.screenmenuactive) {
	
	if (v_screenmenu_windowchanged) {
		v_screenmenu_windowchanged = false;
		window_center();
	}
	
	if (v_screenmenu_control) {
		if (scr_input_ui_check(enum_input.up)) {
			scr_playsfx(snd_UI1);
			v_screenmenu_cursor++;
			if (v_screenmenu_cursor >= v_screenmenu_items) v_screenmenu_cursor = 0;
		}
		if (scr_input_ui_check(enum_input.down)) {
			scr_playsfx(snd_UI1);
			v_screenmenu_cursor--;
			if (v_screenmenu_cursor < 0) v_screenmenu_cursor = v_screenmenu_items - 1;
		}
		if (scr_input_ui_check(enum_input.select)) {
			scr_playsfx(snd_select);
			v_screenmenu_committed = v_screenmenu_cursor;
			v_screenmenu_control = false;
		}
		if (scr_input_ui_check(enum_input.cancel)) {
			scr_playsfx(snd_UIBack);
			global.screenmenuactive = false;
			v_screenmenu_committed = global.novalue;
			v_screenmenu_cursor = 1;
		}
	}
	if (v_screenmenu_committed != global.novalue) {
		switch (v_screenmenu_committed) {
			case 0://back
			global.screenmenuactive = false;
			v_screenmenu_committed = global.novalue;
			v_screenmenu_cursor = 1;
			break;
			case 1://Windowed or Full Screen 
			v_screenmenu_committed = global.novalue;
			v_screenmenu_control = true;
			if window_get_fullscreen() {
				window_set_fullscreen(false);
				global.windowsize = 1;
				v_screenmenu[1] = "Windowed " + string(global.windowsize) + "X";
			} else {
				// windowsize is a multiplier, the reason we have a bunch of + 1's here is because we are about to increase this variable by 1
				if ((global.windowsize + 1)*global.resolution_width < display_get_width() && (global.windowsize + 1)*global.resolution_height < display_get_height()) {
					global.windowsize += 1
					v_screenmenu[1] = "Windowed " + string(global.windowsize) + "X";
				} else {
					window_set_fullscreen(true);
					v_screenmenu[1] = "Full Screen";
				}
			}
			if (!window_get_fullscreen()) v_screenmenu_windowchanged = true;
			window_set_size(global.resolution_width*global.windowsize, global.resolution_height*global.windowsize);
			break;
		}
	}
}