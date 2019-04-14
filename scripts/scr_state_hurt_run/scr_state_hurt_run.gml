/// @description scr_state_hurt_run(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

scr_state_deccount(state); // read in continue script, not here

// velocities are set by knockback values of hitboxes

// the v_state_hurt_ladder gets set by the hitbox, see hitbox code for details
if (!state.v_state_hurt_ladder) scr_state_hurt_ladder_run(ID);
	if (state.v_state_hurt_vel_y < state.v_state_hurt_vel_y_max) state.v_state_hurt_vel_y += state.v_state_hurt_grv_y;
	if (state.v_state_hurt_vel_y > state.v_state_hurt_vel_y_max) state.v_state_hurt_vel_y = state.v_state_hurt_vel_y_max;
	ID.v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(ID, state.v_state_hurt_vel_y, ID.x, o_wall);
	ID.v_act_vel_y = clamp(ID.v_act_vel_y, state.v_state_hurt_vel_y_max *-1, state.v_state_hurt_vel_y_max);
	if (ID.v_act_vel_y == 0) state.v_state_hurt_vel_y = 0;
	
	ID.v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(ID, state.v_state_hurt_vel_x, scr_act_potypos(ID, ID.v_act_vel_y), o_wall);
	ID.v_act_vel_x = clamp(ID.v_act_vel_x, state.v_state_hurt_vel_x_max * -1, state.v_state_hurt_vel_x_max);
	if (state.v_state_count <= 0) {
		if (place_meeting(scr_act_potxpos(ID, ID.v_act_vel_x), scr_act_potypos(ID, ID.v_act_vel_y) + 1, o_wall) && ID.v_act_vel_y == 0) ID.v_act_vel_x = 0;
		if (ID.v_act_vel_x == 0) state.v_state_hurt_vel_x = 0;
	}
else {

}
