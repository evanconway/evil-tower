/// @description Insert description here

//item ease in
//v_menu_y += (v_menu_y_target - v_menu_y) / v_menu_speed;
v_menu_y = v_menu_gui_height - v_menu_gui_margin;

if (global.v_menu_control && global.transition_state == enum_transition_state.off) {
	if (scr_input_ui_check(enum_input.up)) {
		scr_playsfx(snd_UI1);
		v_menu_cursor++;
		if (v_menu_cursor >= v_menu_items) v_menu_cursor = 0;
	}
	if (scr_input_ui_check(enum_input.down)) {
		scr_playsfx(snd_UI1);
		v_menu_cursor--;
		if (v_menu_cursor < 0) v_menu_cursor = v_menu_items - 1;
	}
	if (scr_input_ui_check(enum_input.select)) {
		if (v_menu_cursor == 3) scr_playsfx(snd_success);
		else scr_playsfx(snd_select);
		v_menu_committed = v_menu_cursor;
		global.v_menu_control = false;
	}
}

if (v_menu_committed != global.novalue) {
	switch (v_menu_committed) {
		case 0://quit
		game_end();
		break;
		case 1://options
		global.optionsactive = true;
		o_optionsmenu.v_optionsmenu_control = true;
		v_menu_committed = 4;//this is some weird jank because "button pressed" inputs remain true in different objects step events.
		break;
		case 2://continue
		//does nothing right now
		v_menu_committed = global.novalue;
		global.v_menu_control = true;
		break;
		case 3://new game
		scr_transition(enum_transition_state.goto, Intro);
		break;
		case 4:
		if (!global.optionsactive)  {
			global.v_menu_control = true;
			v_menu_committed = global.novalue;
		}
		break;
	}
}