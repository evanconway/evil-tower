/// @description scr_state_air_dn_change(actor_id)

/// @param o_actor

var ID = argument[0];
var state = ID.v_act_state_cur;

state.v_state_air_vely = ID.v_act_vel_y;
state.v_state_air_velx = ID.v_act_vel_x;
