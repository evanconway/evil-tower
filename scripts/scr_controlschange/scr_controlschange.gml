///@description s_controlschange(keyboard)
///@param keyboard

var result = global.novalue;
if (argument[0])
{
	#region//I think we just have to go through every single key....
	if (keyboard_check_pressed(ord("A")))
	{
		result = ord("A");
	}
	if (keyboard_check_pressed(ord("B")))
	{
		result = ord("B");
	}
	if (keyboard_check_pressed(ord("C")))
	{
		result = ord("C");
	}
	if (keyboard_check_pressed(ord("D")))
	{
		result = ord("D");
	}
	if (keyboard_check_pressed(ord("E")))
	{
		result = ord("E");
	}
	if (keyboard_check_pressed(ord("F")))
	{
		result = ord("F");
	}
	if (keyboard_check_pressed(ord("G")))
	{
		result = ord("G");
	}
	if (keyboard_check_pressed(ord("H")))
	{
		result = ord("H");
	}
	if (keyboard_check_pressed(ord("I")))
	{
		result = ord("I");
	}
	if (keyboard_check_pressed(ord("J")))
	{
		result = ord("J");
	}
	if (keyboard_check_pressed(ord("K")))
	{
		result = ord("K");
	}
	if (keyboard_check_pressed(ord("L")))
	{
		result = ord("L");
	}
	if (keyboard_check_pressed(ord("M")))
	{
		result = ord("M");
	}
	if (keyboard_check_pressed(ord("N")))
	{
		result = ord("N");
	}
	if (keyboard_check_pressed(ord("O")))
	{
		result = ord("O");
	}
	if (keyboard_check_pressed(ord("P")))
	{
		result = ord("P");
	}
	if (keyboard_check_pressed(ord("Q")))
	{
		result = ord("Q");
	}
	if (keyboard_check_pressed(ord("R")))
	{
		result = ord("R");
	}
	if (keyboard_check_pressed(ord("S")))
	{
		result = ord("S");
	}
	if (keyboard_check_pressed(ord("T")))
	{
		result = ord("T");
	}
	if (keyboard_check_pressed(ord("U")))
	{
		result = ord("U");
	}
	if (keyboard_check_pressed(ord("V")))
	{
		result = ord("V");
	}
	if (keyboard_check_pressed(ord("W")))
	{
		result = ord("W");
	}
	if (keyboard_check_pressed(ord("X")))
	{
		result = ord("X");
	}
	if (keyboard_check_pressed(ord("Y")))
	{
		result = ord("Y");
	}
	if (keyboard_check_pressed(ord("Z")))
	{
		result = ord("Z");
	}
	if (keyboard_check_pressed(vk_up))
	{
		result = vk_up;
	}
	if (keyboard_check_pressed(vk_down))
	{
		result = vk_down;
	}
	if (keyboard_check_pressed(vk_left))
	{
		result = vk_left;
	}
	if (keyboard_check_pressed(vk_right))
	{
		result = vk_right;
	}
	if (keyboard_check_pressed(vk_space))
	{
		result = vk_space;
	}
	if (keyboard_check_pressed(vk_lshift))
	{
		result = vk_lshift;
	}
	if (keyboard_check_pressed(vk_rshift))
	{
		result = vk_rshift;
	}
	if (keyboard_check_pressed(vk_lcontrol))
	{
		result = vk_lcontrol;
	}
	if (keyboard_check_pressed(vk_rcontrol))
	{
		result = vk_rcontrol;
	}
	if (keyboard_check_pressed(vk_enter))
	{
		result = vk_enter;
	}
	#endregion
} else {
	//check axis first
	if (gamepad_axis_value(global.controllerport, gp_axislh) < global.axis_deadzone * -1) //&& (global.axis_left_h_prev > global.axis_deadzone * -1)
	{
		result = enum_axis.left_left;
	}
	if (gamepad_axis_value(global.controllerport, gp_axislh) > global.axis_deadzone) //&& (global.axis_left_h_prev < global.axis_deadzone)
	{
		result = enum_axis.left_right;
	}
	if (gamepad_axis_value(global.controllerport, gp_axislv) < global.axis_deadzone * -1) //&& (global.axis_left_v_prev > global.axis_deadzone * -1)
	{
		result = enum_axis.left_up;
	}
	if (gamepad_axis_value(global.controllerport, gp_axislv) > global.axis_deadzone) //&& (global.axis_left_v_prev < global.axis_deadzone)
	{
		result = enum_axis.left_down;
	}
	if (gamepad_axis_value(global.controllerport, gp_axisrh) < global.axis_deadzone * -1) //&& (global.axis_left_h_prev > global.axis_deadzone * -1)
	{
		result = enum_axis.right_left;
	}
	if (gamepad_axis_value(global.controllerport, gp_axisrh) > global.axis_deadzone) //&& (global.axis_left_h_prev < global.axis_deadzone)
	{
		result = enum_axis.right_right;
	}
	if (gamepad_axis_value(global.controllerport, gp_axisrv) < global.axis_deadzone * -1) //&& (global.axis_left_v_prev > global.axis_deadzone * -1)
	{
		result = enum_axis.right_up;
	}
	if (gamepad_axis_value(global.controllerport, gp_axisrv) > global.axis_deadzone) //&& (global.axis_left_v_prev < global.axis_deadzone)
	{
		result = enum_axis.right_down;
	}
	if (gamepad_button_value(global.controllerport, gp_shoulderlb) > global.axis_deadzone)
	{
		result = enum_axis.trigger_left;
	}
	if (gamepad_button_value(global.controllerport, gp_shoulderrb) > global.axis_deadzone)
	{
		result = enum_axis.trigger_right;
	}
	//now buttons
	if (gamepad_button_check_pressed(global.controllerport, gp_face1))
	{
		result = gp_face1;
	}
	if (gamepad_button_check_pressed(global.controllerport, gp_face2))
	{
		result = gp_face2;
	}
	if (gamepad_button_check_pressed(global.controllerport, gp_face3))
	{
		result = gp_face3;
	}
	if (gamepad_button_check_pressed(global.controllerport, gp_face4))
	{
		result = gp_face4;
	}
	if (gamepad_button_check_pressed(global.controllerport, gp_padu))
	{
		result = gp_padu;
	}
	if (gamepad_button_check_pressed(global.controllerport, gp_padd))
	{
		result = gp_padd;
	}
	if (gamepad_button_check_pressed(global.controllerport, gp_padl))
	{
		result = gp_padl;
	}
	if (gamepad_button_check_pressed(global.controllerport, gp_padr))
	{
		result = gp_padr;
	}
	if (gamepad_button_check_pressed(global.controllerport, gp_shoulderl))
	{
		result = gp_shoulderl;
	}
	if (gamepad_button_check_pressed(global.controllerport, gp_shoulderr))
	{
		result = gp_shoulderr;
	}
}

return result;