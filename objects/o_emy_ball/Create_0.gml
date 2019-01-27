/// @description Insert description here
// You can write your code in this editor

event_inherited();

v_act_vel_runaccel = 0.1;
v_act_vel_x_max = 1;

v_act_input_x_start = x;
v_act_input_y_start = y;
v_ball_life = 10;

enum enum_ball_state {
	rolling,
	falling,
	dying
}

v_ball_state = enum_ball_state.falling;