/// @description 

global.usecontroller = false;
global.controllerport = 0;

global.input_keyboard_left = ord("A");
global.input_keyboard_right = ord("D");
global.input_keyboard_up = ord("W");
global.input_keyboard_down = ord("S");
global.input_keyboard_button1 = ord("K");
global.input_keyboard_button2 = ord("J");
global.input_keyboard_button3 = ord("L");
global.input_keyboard_start = vk_escape;
global.input_keyboard_select = vk_enter;
global.input_keyboard_cancel =  vk_escape;
global.input_debugging = false;

enum enum_axis {
	trigger_left = -10,
	trigger_right = -9,
	left_left = -8,
	left_right = -7,
	left_up = -6,
	left_down = -5,
	right_left = -4,
	right_right = -3,
	right_up = -2,
	right_down = -1
}

enum enum_attack_stage {
	startup,
	swing,
	recovery
}

global.trigger_left_prev = 0;
global.trigger_right_prev = 0;
global.axis_left_h_prev = 0;
global.axis_left_v_prev = 0;
global.axis_right_h_prev = 0;
global.axis_right_v_prev = 0;

global.axis_deadzone = 0.6;

global.input_controller_up = enum_axis.left_up;//axis inputs must be assigned with our enumerator, not gml 
global.input_controller_down = enum_axis.left_down;
global.input_controller_left = enum_axis.left_left;
global.input_controller_right = enum_axis.left_right;
global.input_controller_button1 = gp_face1;
global.input_controller_button2 = gp_face2;
global.input_controller_button3 = gp_face3;
global.input_controller_start = gp_start;
global.input_controller_select = gp_face1;
global.input_controller_cancel =  gp_face2;

enum enum_input {
	left,
	right,
	up,
	down,
	button1,
	button2,
	button3,
	start,
	select,
	cancel
}
