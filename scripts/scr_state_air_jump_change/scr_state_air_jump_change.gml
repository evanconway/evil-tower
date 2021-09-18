/// @description scr_state_air_jump_change(actor_id)
function scr_state_air_jump_change() {

	/// @param o_actor

	var ID = argument[0];
	var state = ID.v_act_state_cur;
	ID.v_act_vel_y = ID.v_act_jump;
	if (state.v_state_sound != undefined) scr_playsfx(state.v_state_sound);



}
