/// @description scr_input_ui_check(enum_input)

/// @param enum_input
var result = false;

switch(argument[0]) {
	case enum_input.up:
	if (scr_input_check(true, enum_input.up)) result = true;
	else {
		if (keyboard_check_pressed(vk_up) ||
		gamepad_button_check_pressed(global.controllerport, gp_padu)) result = true;
	}
	break;
	case enum_input.down:
	if (scr_input_check(true, enum_input.down)) result = true;
	else {
		if (keyboard_check_pressed(vk_down) ||
		gamepad_button_check_pressed(global.controllerport, gp_padd)) result = true;
	}
	break;
	case enum_input.left:
	if (scr_input_check(true, enum_input.left)) result = true;
	else {
		if (keyboard_check_pressed(vk_left) ||
		gamepad_button_check_pressed(global.controllerport, gp_padl)) result = true;
	}
	break;
	case enum_input.right:
	if (scr_input_check(true, enum_input.right)) result = true;
	else {
		if (keyboard_check_pressed(vk_right) ||
		gamepad_button_check_pressed(global.controllerport, gp_padr)) result = true;
	}
	break;
	case enum_input.select:
	if (scr_input_check(true, enum_input.select)) result = true;
	else {
		if (keyboard_check_pressed(vk_enter) ||
		gamepad_button_check_pressed(global.controllerport, gp_select)) result = true;
	}
	break;
	case enum_input.cancel:
	if (scr_input_check(true, enum_input.cancel)) result = true;
	else {
		if (keyboard_check_pressed(vk_escape) ||
		gamepad_button_check_pressed(global.controllerport, gp_face2)) result = true;
	}
	break;
	case enum_input.start:
	if (scr_input_check(true,enum_input.start)) result = true;
	else {
		if (keyboard_check_pressed(vk_escape) ||
		gamepad_button_check_pressed(global.controllerport, gp_start)) result = true;
	}
	break;
}

return result;