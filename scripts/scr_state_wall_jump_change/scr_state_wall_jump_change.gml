/// @description scr_state_walljumpchange(actor_id)
/// @param o_actor

var ID = argument[0];
var state = ID.v_act_state_cur;

scr_actor_resetcontroller(ID);

if (place_meeting(ID.x-1, ID.y, o_wall)) {
	ID.v_act_vel_x = state.v_state_air_velx_max;
	ID.v_act_controller.v_actcon_right = true;
} else {
	ID.v_act_vel_x = state.v_state_air_velx_max * -1;
	ID.v_act_controller.v_actcon_left = true;
}
ID.v_act_vel_y = state.v_state_air_up_jumppwr;
ID.v_act_inputlocktime = state.v_state_count_max;
state.v_state_air_velx = ID.v_act_vel_x;
state.v_state_air_vely = ID.v_act_vel_y;

scr_playsfx(snd_jump);
