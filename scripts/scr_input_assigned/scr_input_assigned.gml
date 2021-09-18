///@dscription s_input_assigned(keyboard, input)
///@param keyboard
///@param input
function scr_input_assigned() {

	var result = global.novalue;

	if (argument[0])
	{
		switch(argument[1])
		{
			case enum_input.button1:
			result = global.input_keyboard_button1;
			break;
			case enum_input.button2:
			result = global.input_keyboard_button2;
			break;
			case enum_input.button3:
			result = global.input_keyboard_button3;
			break;
			case enum_input.up:
			result = global.input_keyboard_up;
			break;
			case enum_input.down:
			result = global.input_keyboard_down;
			break;
			case enum_input.left:
			result = global.input_keyboard_left;
			break;
			case enum_input.right:
			result = global.input_keyboard_right;
			break;
		}
	} else {
		switch(argument[1])
		{
			case enum_input.button1:
			result = global.input_controller_button1;
			break;
			case enum_input.button2:
			result = global.input_controller_button2;
			break;
			case enum_input.button3:
			result = global.input_controller_button3;
			break;
			case enum_input.up:
			result = global.input_controller_up;
			break;
			case enum_input.down:
			result = global.input_controller_down;
			break;
			case enum_input.left:
			result = global.input_controller_left;
			break;
			case enum_input.right:
			result = global.input_controller_right;
			break;
		}
	}

	return result;


}
