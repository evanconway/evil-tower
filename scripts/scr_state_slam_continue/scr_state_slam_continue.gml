/// @description scr_state_slam_continue(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

return !state.v_state_slam_finished;
