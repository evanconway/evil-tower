/// @description Insert description here
// You can write your code in this editor
if (global.usecontroller) {
	global.trigger_left_prev = gamepad_button_value(global.controllerport, gp_shoulderlb);
	global.trigger_right_prev = gamepad_button_value(global.controllerport, gp_shoulderrb);
	global.axis_left_h_prev = gamepad_axis_value(global.controllerport, gp_axislh);
	global.axis_left_v_prev = gamepad_axis_value(global.controllerport, gp_axislv);
	global.axis_right_h_prev = gamepad_axis_value(global.controllerport, gp_axisrh);
	global.axis_right_v_prev = gamepad_axis_value(global.controllerport, gp_axisrv);
}

if (global.prevroom != room) global.prevroom = room;


if (room == 0) room_goto_next();