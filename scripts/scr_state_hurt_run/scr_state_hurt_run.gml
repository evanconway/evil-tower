/// @description scr_state_hurt_run(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

if (state.v_state_count <= 0) v_state_hurt_stage = enum_hurt_stage.move;
scr_state_deccount(state);

switch (state.v_state_hurt_stage) {
	case enum_hurt_stage.stun:
	if (state.v_state_count <= 0) {
		state.v_state_hurt_stage = enum_hurt_stage.move;
		state.v_state_count = state.v_state_count_max;
	}
	ID.v_act_vel_x = 0;
	ID.v_act_vel_y = 0;
	break;
	case enum_hurt_stage.move:
	if (state.v_state_hurt_ladder) scr_state_hurt_ladder_run(ID);
	else {
		if (state.v_state_hurt_vel_y < state.v_state_hurt_vel_y_max) state.v_state_hurt_vel_y += state.v_state_hurt_grv_y;
		if (state.v_state_hurt_vel_y > state.v_state_hurt_vel_y_max) state.v_state_hurt_vel_y = state.v_state_hurt_vel_y_max;
		ID.v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(ID, state.v_state_hurt_vel_y, ID.x, o_wall);
		if (ID.v_act_vel_y == 0) state.v_state_hurt_vel_y = 0;
		ID.v_act_vel_y = clamp(ID.v_act_vel_y, state.v_state_hurt_vel_y_max *-1, state.v_state_hurt_vel_y_max);
	
		ID.v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(ID, state.v_state_hurt_vel_x, scr_act_potypos(ID, ID.v_act_vel_y), o_wall);
		if (place_meeting(ID.x, ID.y + 1, o_wall) && ID.v_act_vel_y == 0) ID.v_act_vel_x = 0;
	}
	break;
}
