/// @description scr_input_check(pressed, button)
/// @param pressed
/// @param button
function scr_input_check() {

	var result = false;

	if (global.usecontroller)
	{
		if (argument[0])//check for pressed
		{
			switch(argument[1])
			{
			case enum_input.left:
			if (scr_input_useaxis(global.input_controller_left))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_left);
			} else result = gamepad_button_check_pressed(global.controllerport, global.input_controller_left);
			break;
			case enum_input.right:
			if (scr_input_useaxis(global.input_controller_right))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_right);
			} else result = gamepad_button_check_pressed(global.controllerport, global.input_controller_right);
			break;
			case enum_input.up:
			if (scr_input_useaxis(global.input_controller_up))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_up);
			} else result = gamepad_button_check_pressed(global.controllerport, global.input_controller_up);
			break;
			case enum_input.down:
			if (scr_input_useaxis(global.input_controller_down))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_down);
			} else result = gamepad_button_check_pressed(global.controllerport, global.input_controller_down);
			break;
			case enum_input.button1:
			if (scr_input_useaxis(global.input_controller_button1))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_button1);
			} else result = gamepad_button_check_pressed(global.controllerport, global.input_controller_button1);
			break;
			case enum_input.button2:
			if (scr_input_useaxis(global.input_controller_button2))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_button2);
			} else result = gamepad_button_check_pressed(global.controllerport, global.input_controller_button2);
			break;
			case enum_input.button3:
			if (scr_input_useaxis(global.input_controller_button3))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_button3);
			} else result = gamepad_button_check_pressed(global.controllerport, global.input_controller_button3);
			break;
			case enum_input.start:
			if (scr_input_useaxis(global.input_controller_start))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_start);
			} else result = gamepad_button_check_pressed(global.controllerport, global.input_controller_start);
			break;
			case enum_input.select:
			if (scr_input_useaxis(global.input_controller_select))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_select);
			} else result = gamepad_button_check_pressed(global.controllerport, global.input_controller_select);
			break;
			case enum_input.cancel:
			if (scr_input_useaxis(global.input_controller_cancel))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_cancel);
			} else result = gamepad_button_check_pressed(global.controllerport, global.input_controller_cancel);
			break;
			}
		} else {
			switch(argument[1])
			{
			case enum_input.left:
			if (scr_input_useaxis(global.input_controller_left))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_left);
			} else result = gamepad_button_check(global.controllerport, global.input_controller_left);
			break;
			case enum_input.right:
			if (scr_input_useaxis(global.input_controller_right))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_right);
			} else result = gamepad_button_check(global.controllerport, global.input_controller_right);
			break;
			case enum_input.up:
			if (scr_input_useaxis(global.input_controller_up))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_up);
			} else result = gamepad_button_check(global.controllerport, global.input_controller_up);
			break;
			case enum_input.down:
			if (scr_input_useaxis(global.input_controller_down))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_down);
			} else result = gamepad_button_check(global.controllerport, global.input_controller_down);
			break;
			case enum_input.button1:
			if (scr_input_useaxis(global.input_controller_button1))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_button1);
			} else result = gamepad_button_check(global.controllerport, global.input_controller_button1);
			break;
			case enum_input.button2:
			if (scr_input_useaxis(global.input_controller_button2))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_button2);
			} else result = gamepad_button_check(global.controllerport, global.input_controller_button2);
			break;
			case enum_input.button3:
			if (scr_input_useaxis(global.input_controller_button3))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_button3);
			} else result = gamepad_button_check(global.controllerport, global.input_controller_button3);
			break;
			case enum_input.start:
			if (scr_input_useaxis(global.input_controller_start))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_start);
			} else result = gamepad_button_check(global.controllerport, global.input_controller_start);
			break;
			case enum_input.select:
			if (scr_input_useaxis(global.input_controller_select))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_select);
			} else result = gamepad_button_check(global.controllerport, global.input_controller_select);
			break;
			case enum_input.cancel:
			if (scr_input_useaxis(global.input_controller_cancel))
			{
				result = scr_input_axis_check(argument[0], global.input_controller_cancel);
			} else result = gamepad_button_check(global.controllerport, global.input_controller_cancel);
			break;
			}
		}
	} else {
		if (argument[0])
		{
			switch(argument[1])
			{
			case enum_input.left:
			result = keyboard_check_pressed(global.input_keyboard_left);
			break;
			case enum_input.right:
			result = keyboard_check_pressed(global.input_keyboard_right);
			break;
			case enum_input.up:
			result = keyboard_check_pressed(global.input_keyboard_up);
			break;
			case enum_input.down:
			result = keyboard_check_pressed(global.input_keyboard_down);
			break;
			case enum_input.button1:
			result = keyboard_check_pressed(global.input_keyboard_button1);
			break;
			case enum_input.button2:
			result = keyboard_check_pressed(global.input_keyboard_button2);
			break;
			case enum_input.button3:
			result = keyboard_check_pressed(global.input_keyboard_button3);
			break;
			case enum_input.start:
			result = keyboard_check_pressed(global.input_keyboard_start);
			break;
			case enum_input.select:
			result = keyboard_check_pressed(global.input_keyboard_select);
			break;
			case enum_input.cancel:
			result = keyboard_check_pressed(global.input_keyboard_cancel);
			break;
			}
		} else {
			switch(argument[1])
			{
			case enum_input.left:
			result = keyboard_check(global.input_keyboard_left);
			break;
			case enum_input.right:
			result = keyboard_check(global.input_keyboard_right);
			break;
			case enum_input.up:
			result = keyboard_check(global.input_keyboard_up);
			break;
			case enum_input.down:
			result = keyboard_check(global.input_keyboard_down);
			break;
			case enum_input.button1:
			result = keyboard_check(global.input_keyboard_button1);
			break;
			case enum_input.button2:
			result = keyboard_check(global.input_keyboard_button2);
			break;
			case enum_input.button3:
			result = keyboard_check(global.input_keyboard_button3);
			break;
			case enum_input.start:
			result = keyboard_check(global.input_keyboard_start);
			break;
			case enum_input.select:
			result = keyboard_check(global.input_keyboard_select);
			break;
			case enum_input.cancel:
			result = keyboard_check(global.input_keyboard_cancel);
			break;
			}
		}
	}

	return result;


}
