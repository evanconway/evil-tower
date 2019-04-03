/// @description scr_state_hurt_continue(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur; // this will be the hurt state
var result = false;

if (state.v_state_count > state.v_state_count_min) result = true;

return result;
