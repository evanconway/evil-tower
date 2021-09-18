/// @description scr_state_slam_change(o_actor)
/// @param actor_id
function scr_state_slam_change() {

	var ID = argument[0];
	var state = ID.v_act_state_cur;

	scr_state_changesprite(ID);

	state.v_state_slam_finished = false;
	state.v_state_slam_stage = 0;
	state.v_state_count = 15; // frames frozen in air



}
