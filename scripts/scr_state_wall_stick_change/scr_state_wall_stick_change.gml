/// @description scr_state_wall_stick_change(actor_id)

/// @param o_actor
/* 
remember that change scripts do not need the state as an argument because 
the actor will already have its state changed to the new state.
*/

var ID = argument[0];
var state = ID.v_act_state_cur;

ID.v_act_vel_y = 0;
state.v_state_count = state.v_state_count_max;

/* Determine X velocity
X velocity in this case is the distance we need to move the actor to get them touching the
wall they are trying to jump off of. 
*/
state.v_state_wall_stick_sign = -1;
ID.v_act_faceright = true;
state.v_state_wall_stick_Rwall = false;
state.v_state_wall_stick_Lwall = true;
if (ID.v_act_actcon.v_actcon_right) {
	state.v_state_wall_stick_sign = 1;
	ID.v_act_faceright = false;
	state.v_state_wall_stick_Rwall = true;
	state.v_state_wall_stick_Lwall = false;
}

scr_state_changesprite(ID);

scr_playsfx(snd_tick);
