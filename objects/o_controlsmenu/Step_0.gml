/// @description Insert description here

if (global.controlsactive) {
	if (v_controlsmenu_control) {
		if (scr_input_ui_check(enum_input.up)) {
			scr_playsfx(snd_UI1);
			v_controlsmenu_cursor++;
			if (v_controlsmenu_cursor >= v_controlsmenu_items) v_controlsmenu_cursor = 0;
		}
		if (scr_input_ui_check(enum_input.down)) {
			scr_playsfx(snd_UI1);
			v_controlsmenu_cursor--;
			if (v_controlsmenu_cursor < 0) v_controlsmenu_cursor = v_controlsmenu_items - 1;
		}
		if (scr_input_ui_check(enum_input.select)) {
			scr_playsfx(snd_select);
			v_controlsmenu_committed = v_controlsmenu_cursor;
			v_controlsmenu_control = false;
		}
		if (scr_input_ui_check(enum_input.cancel)) {
			scr_playsfx(snd_UIBack);
			global.controlsactive = false;
			v_controlsmenu_committed = global.novalue;
			v_controlsmenu_cursor = 8;
		}
	}
	if (v_controlsmenu_committed != global.novalue) {
		switch (v_controlsmenu_committed) {
			case 0://back
			global.controlsactive = false;
			v_controlsmenu_committed = global.novalue;
			v_controlsmenu_cursor = 8;
			break;
			case 1://right
			v_controlsmenu_committed = 9;
			v_controlsmenu_control = false;
			v_controlsmenu_change = true;
			v_controlkeychanging = enum_input.right;
			break;
			case 2://left
			v_controlsmenu_committed = 9;
			v_controlsmenu_control = false;
			v_controlsmenu_change = true;
			v_controlkeychanging = enum_input.left;
			break;
			case 3://down
			v_controlsmenu_committed = 9;
			v_controlsmenu_control = false;
			v_controlsmenu_change = true;
			v_controlkeychanging = enum_input.down;
			break;
			case 4://up
			v_controlsmenu_committed = 9;
			v_controlsmenu_control = false;
			v_controlsmenu_change = true;
			v_controlkeychanging = enum_input.up;
			break;
			case 5://button 3
			v_controlsmenu_committed = 9;
			v_controlsmenu_control = false;
			v_controlsmenu_change = true;
			v_controlkeychanging = enum_input.button3;
			break;
			case 6://button 2
			v_controlsmenu_committed = 9;
			v_controlsmenu_control = false;
			v_controlsmenu_change = true;
			v_controlkeychanging = enum_input.button2;
			break;
			case 7://button 1
			v_controlsmenu_committed = 9;
			v_controlsmenu_control = false;
			v_controlsmenu_change = true;
			v_controlkeychanging = enum_input.button1;
			break;
			case 8://keyboard or controller
			if (v_controlsmenu_showforkeyboard) v_controlsmenu_showforkeyboard = false;
			else v_controlsmenu_showforkeyboard = true;
			v_controlsmenu_committed = global.novalue;
			v_controlsmenu_control = true;
			break;
			
			//non-menu stuff
			
			case 9://change control (triggers are broken)
			var newkey = scr_controlschange(v_controlsmenu_showforkeyboard);
			if (newkey != global.novalue) {
				scr_playsfx(snd_success);
				v_controlsmenu_change = false;
				v_controlsmenu_committed = global.novalue;
				v_controlsmenu_control = true;
				#region//switch controls if there are conflicts
				if (v_controlsmenu_showforkeyboard) {
					if (global.input_keyboard_button1 == newkey) global.input_keyboard_button1 = scr_input_assigned(true, v_controlkeychanging);//whatever key is currently assigned to v_controlkeychanging
					if (global.input_keyboard_button2 == newkey) global.input_keyboard_button2 = scr_input_assigned(true, v_controlkeychanging);
					if (global.input_keyboard_button3 == newkey) global.input_keyboard_button3 = scr_input_assigned(true, v_controlkeychanging);
					if (global.input_keyboard_up == newkey) global.input_keyboard_up = scr_input_assigned(true, v_controlkeychanging);
					if (global.input_keyboard_down == newkey) global.input_keyboard_down = scr_input_assigned(true, v_controlkeychanging);
					if (global.input_keyboard_left == newkey) global.input_keyboard_left = scr_input_assigned(true, v_controlkeychanging);
					if (global.input_keyboard_right == newkey) global.input_keyboard_right = scr_input_assigned(true, v_controlkeychanging);
				} else {
					if (global.input_controller_button1 == newkey) global.input_controller_button1 = scr_input_assigned(false, v_controlkeychanging);//whatever key is currently assigned to v_controlkeychanging
					if (global.input_controller_button2 == newkey) global.input_controller_button2 = scr_input_assigned(false, v_controlkeychanging);
					if (global.input_controller_button3 == newkey) global.input_controller_button3 = scr_input_assigned(false, v_controlkeychanging);
					if (global.input_controller_up == newkey) global.input_controller_up = scr_input_assigned(false, v_controlkeychanging);
					if (global.input_controller_down == newkey) global.input_controller_down = scr_input_assigned(false, v_controlkeychanging);
					if (global.input_controller_left == newkey) global.input_controller_left = scr_input_assigned(false, v_controlkeychanging);
					if (global.input_controller_right == newkey) global.input_controller_right = scr_input_assigned(false, v_controlkeychanging);
				}
				#endregion
				#region//assign new key
				switch (v_controlkeychanging) {
					case enum_input.button1:
					if (v_controlsmenu_showforkeyboard) global.input_keyboard_button1 = newkey;
					else global.input_controller_button1 = newkey;
					break;
					case enum_input.button2:
					if (v_controlsmenu_showforkeyboard) global.input_keyboard_button2 = newkey;
					else global.input_controller_button2 = newkey;
					break;
					case enum_input.button3:
					if (v_controlsmenu_showforkeyboard) global.input_keyboard_button3 = newkey;
					else global.input_controller_button3 = newkey;
					break;
					case enum_input.up:
					if (v_controlsmenu_showforkeyboard) global.input_keyboard_up = newkey;
					else global.input_controller_up = newkey;
					break;
					case enum_input.down:
					if (v_controlsmenu_showforkeyboard) global.input_keyboard_down = newkey;
					else global.input_controller_down = newkey;
					break;
					case enum_input.left:
					if (v_controlsmenu_showforkeyboard) global.input_keyboard_left = newkey;
					else global.input_controller_left = newkey;
					break;
					case enum_input.right:
					if (v_controlsmenu_showforkeyboard) global.input_keyboard_right = newkey;
					else global.input_controller_right = newkey;
					break;
				}
				#endregion
				v_controlkeychanging = global.novalue;
			}
		}
	}
}