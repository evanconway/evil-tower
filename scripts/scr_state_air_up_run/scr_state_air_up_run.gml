/// @description scr_state_air_up_run(actor_id)

/// @param o_actor

var ID = argument[0];
var state = ID.v_act_state_cur;
var vel_y = state.v_state_air_vely;
var vel_x = state.v_state_air_velx;

// determine y velocity
if (vel_y < 0) {
	vel_y += state.v_state_air_accy;
	if (vel_y > 0) vel_y = 0;
} else vel_y = 0;

// set y velocity
if (vel_y >= 0) {
	if (vel_y > state.v_state_air_vely_max) ID.v_act_vel_y = state.v_state_air_vely_max;
	else ID.v_act_vel_y = vel_y;
} else {
	if (vel_y < state.v_state_air_vely_max * -1) ID.v_act_vel_y = state.v_state_air_vely_max * -1;
	else ID.v_act_vel_y = vel_y;
}
ID.v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(ID, ID.v_act_vel_y, ID.x, o_wall);
state.v_state_air_vely = vel_y;

// determine x velocity
if (ID.v_act_controller.v_actcon_right && !ID.v_act_controller.v_actcon_left) {
	vel_x += state.v_state_air_accx;
	if (vel_x > state.v_state_air_velx_max) vel_x = state.v_state_air_velx_max;
	if (vel_x < 0) ID.v_act_faceright = false;
	else ID.v_act_faceright = true;
}
if (!ID.v_act_controller.v_actcon_right && ID.v_act_controller.v_actcon_left) {
	vel_x -= state.v_state_air_accx;
	if (vel_x < state.v_state_air_velx_max * -1) vel_x = state.v_state_air_velx_max * -1;
	if (vel_x > 0) ID.v_act_faceright = true;
	else ID.v_act_faceright = false;
}
if (!ID.v_act_controller.v_actcon_right && !ID.v_act_controller.v_actcon_left) {
	if (vel_x > 0) {
		vel_x -= state.v_state_air_accx;
		if (vel_x < 0) vel_x = 0;
	} else {
		vel_x += state.v_state_air_accx;
		if (vel_x > 0) vel_x = 0;
	}
}
vel_x = scr_obj_approachdist_x_at_y_against_obj(ID, vel_x, scr_act_potypos(ID, ID.v_act_vel_y), o_wall);
state.v_state_air_velx = vel_x;
ID.v_act_vel_x = vel_x;

if (ID.v_act_faceright) ID.sprite_index = state.v_state_sprite;
else ID.sprite_index = state.v_state_sprite_left;
