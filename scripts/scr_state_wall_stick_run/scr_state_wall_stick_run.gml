/// @description scr_state_wall_stick_run(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

scr_state_deccount(ID);
ID.v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(ID, state.v_state_wall_stick_dist * state.v_state_wall_stick_sign, ID.y, o_wall);