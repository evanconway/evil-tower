/// @description s_input_axis_check(pressed, enum_axis)
/// @param pressed
/// @param enum_axis
function scr_input_axis_check() {

	var result = false;

	switch (argument[1])
	{
		case enum_axis.trigger_left:
		if (argument[0])
		{
			if (gamepad_button_value(global.controllerport, gp_shoulderlb) > global.axis_deadzone) && !(global.trigger_left_prev > global.axis_deadzone) result = true;
		} else {
			if (gamepad_button_value(global.controllerport, gp_shoulderlb) > global.axis_deadzone) result = true;
		}
		break;
		case enum_axis.trigger_right:
		if (argument[0])
		{
			if (gamepad_button_value(global.controllerport, gp_shoulderrb) > global.axis_deadzone) && !(global.trigger_right_prev > global.axis_deadzone) result = true;
		} else {
			if (gamepad_button_value(global.controllerport, gp_shoulderrb) > global.axis_deadzone) result = true;
		}
		break;
		case enum_axis.left_left:
		if (argument[0])
		{
			if (gamepad_axis_value(global.controllerport, gp_axislh) < global.axis_deadzone * -1) && !(global.axis_left_h_prev < global.axis_deadzone * -1) result = true;
		} else {
			if (gamepad_axis_value(global.controllerport, gp_axislh) < global.axis_deadzone * -1) result = true;
		}
		break;
		case enum_axis.left_right:
		if (argument[0])
		{
			if (gamepad_axis_value(global.controllerport, gp_axislh) > global.axis_deadzone) && !(global.axis_left_h_prev > global.axis_deadzone) result = true;
		} else {
			if (gamepad_axis_value(global.controllerport, gp_axislh) > global.axis_deadzone) result = true;
		}
		break;
		case enum_axis.left_up:
		if (argument[0])
		{
			if (gamepad_axis_value(global.controllerport, gp_axislv) < global.axis_deadzone * -1) && !(global.axis_left_v_prev < global.axis_deadzone * -1) result = true;
		} else {
			if (gamepad_axis_value(global.controllerport, gp_axislv) < global.axis_deadzone * -1) result = true;
		}
		break;
		case enum_axis.left_down:
		if (argument[0])
		{
			if (gamepad_axis_value(global.controllerport, gp_axislv) > global.axis_deadzone) && !(global.axis_left_v_prev > global.axis_deadzone) result = true;
		} else {
			if (gamepad_axis_value(global.controllerport, gp_axislv) > global.axis_deadzone) result = true;
		}
		break;
		case enum_axis.right_left:
		if (argument[0])
		{
			if (gamepad_axis_value(global.controllerport, gp_axisrh) < global.axis_deadzone * -1) && !(global.axis_right_h_prev < global.axis_deadzone * -1) result = true;
		} else {
			if (gamepad_axis_value(global.controllerport, gp_axisrh) < global.axis_deadzone * -1) result = true;
		}
		break;
		case enum_axis.right_right:
		if (argument[0])
		{
			if (gamepad_axis_value(global.controllerport, gp_axisrh) > global.axis_deadzone) && !(global.axis_right_h_prev > global.axis_deadzone) result = true;
		} else {
			if (gamepad_axis_value(global.controllerport, gp_axisrh) > global.axis_deadzone) result = true;
		}
		break;
		case enum_axis.right_up:
		if (argument[0])
		{
			if (gamepad_axis_value(global.controllerport, gp_axisrv) < global.axis_deadzone * -1) && !(global.axis_right_v_prev < global.axis_deadzone * -1) result = true;
		} else {
			if (gamepad_axis_value(global.controllerport, gp_axisrv) < global.axis_deadzone * -1) result = true;
		}
		break;
		case enum_axis.right_down:
		if (argument[0])
		{
			if (gamepad_axis_value(global.controllerport, gp_axisrv) > global.axis_deadzone) && !(global.axis_right_v_prev > global.axis_deadzone) result = true;
		} else {
			if (gamepad_axis_value(global.controllerport, gp_axisrv) > global.axis_deadzone) result = true;
		}
		break;
	}

	return result;


}
