/// @description scr_state_attack_continue(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;
var result = false;

if (state.v_state_attack_stage != enum_attack_stage.finished) result = true;

return result;
