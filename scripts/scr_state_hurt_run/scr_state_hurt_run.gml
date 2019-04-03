/// @description scr_state_hurt_run(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

scr_state_deccount(state);

ID.v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(ID, ID.v_act_vel_x, ID.y, o_wall);

if (state.v_state_hurt_vel_y < state.v_state_hurt_vel_y_max) state.v_state_hurt_vel_y += state.v_state_hurt_grv_y;
if (state.v_state_hurt_vel_y > state.v_state_hurt_vel_y_max) state.v_state_hurt_vel_y = state.v_state_hurt_vel_y_max;
ID.v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(ID, state.v_state_hurt_vel_y, scr_act_potxpos(ID, ID.v_act_vel_x), o_wall);
if (ID.v_act_vel_y == 0) state.v_state_hurt_vel_y = 0;
ID.v_act_vel_y = clamp(ID.v_act_vel_y, state.v_state_hurt_vel_y_max *-1, state.v_state_hurt_vel_y_max);
