/// @description scr_state_wall_stick_run(o_actor)
/// @param actor_id
function scr_state_wall_stick_run() {

	var ID = argument[0];
	var state = ID.v_act_state_cur;

	scr_state_deccount(state);

	/*
	We want the actor to snap to the wall, but our wall check distance is bigger than the velocity
	cap on our actor. So we are going to make an exception to our design here. We are going to move 
	the actor here, instead of just setting velocity values, to get around the velocity cap in the
	regular step event.
	*/

	scr_act_resetxinputstart(ID);
	scr_act_resetyinputstart(ID);

	ID.v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(ID, state.v_state_wall_stick_dist * state.v_state_wall_stick_sign, ID.y, o_wall);

	scr_act_move_x(ID, ID.v_act_vel_x);

	ID.v_act_vel_x = 0;
	ID.v_act_vel_y = 0;



}
