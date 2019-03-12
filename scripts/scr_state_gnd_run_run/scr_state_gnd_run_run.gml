/// @description scr_state_gnd_run_run(actor_id)

/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;
var act_controller = ID.v_act_controller;

// Note that it's a good idea to set a velocity to 0 for a state if you know it won't change in that state
ID.v_act_vel_y = 0;

// determine sprite direction
if (act_controller.v_actcon_right && !act_controller.v_actcon_left) {
	ID.v_act_faceright = true;
	ID.sprite_index = state.v_state_sprite;
	ID.v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(ID, state.v_state_gnd_run_maxx, ID.y, o_wall);
}
if (act_controller.v_actcon_left && !act_controller.v_actcon_right) {
	ID.v_act_faceright = false;
	ID.sprite_index = state.v_state_sprite_left;
	ID.v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(ID, state.v_state_gnd_run_maxx * -1, ID.y, o_wall);;
}

if (ID.v_act_faceright != ID.v_act_faceright_prev) ID.image_index = 0;

if (!act_controller.v_actcon_right && !act_controller.v_actcon_left) {
	ID.v_act_vel_x = 0;
}

/*

OK... we're just not going to worry about super cool/fancy run physics
until we want/need them. Since all the run code is just in this script, 
it will be very easy to change later and we don't have to do this now. 

if (act_controller.v_actcon_right) ID.v_act_vel_x += state.v_state_gnd_run_accx;
if (ID.v_act_vel_x > state.v_state_gnd_run_maxx) ID.v_act_vel_x = state.v_state_gnd_run_maxx;

if (act_controller.v_actcon_left) ID.v_act_vel_x -= state.v_state_gnd_run_accx;
if (ID.v_act_vel_x < state.v_state_gnd_run_maxx * -1) ID.v_act_vel_x = state.v_state_gnd_run_maxx * -1;
*/
