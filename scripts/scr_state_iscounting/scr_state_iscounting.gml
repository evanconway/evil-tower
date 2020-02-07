/// @description scr_state_iscounting(actor_id)

/// @param o_actor

var result = false;
var state = argument[0].v_act_state_cur;
if (state.v_state_count > 0) result = true;
return result;