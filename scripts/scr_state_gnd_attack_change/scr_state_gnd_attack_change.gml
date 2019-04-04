/// @description scr_state_gnd_attack_change(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

scr_state_changesprite(ID);
state.v_state_attack_stage = enum_attack_stage.startup;
state.v_state_count = state.v_state_attack_startup;

ID.v_act_vel_x = 0;
ID.v_act_vel_y = 0;
