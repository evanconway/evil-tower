/// @description scr_state_walljumpchange(actor_id)
/// @param o_actor
function scr_state_wall_jump_change() {

	var ID = argument[0];
	var state = ID.v_act_state_cur;

	scr_actcon_reset(ID.v_act_actcon);

	if (place_meeting(ID.x-1, ID.y, o_wall)) {
		ID.v_act_vel_x = ID.v_act_vel_x_max;
		ID.v_act_actcon.v_actcon_right = true;
	} else {
		ID.v_act_vel_x = ID.v_act_vel_x_max * -1;
		ID.v_act_actcon.v_actcon_left = true;
	}
	ID.v_act_vel_x *= 5;
	ID.v_act_vel_y = ID.v_act_jump;
	//ID.v_act_inputlocktime = state.v_state_count_max;

	scr_playsfx(state.v_state_sound);



}
