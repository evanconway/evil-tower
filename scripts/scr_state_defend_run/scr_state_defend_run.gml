/// @description scr_state_defend_run(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

ID.image_speed = 0;

if (state.v_state_defend_time > 0) {
	state.v_state_defend_time--;
	if (ID.v_act_vel_y < ID.v_act_vel_y_max) ID.v_act_vel_y += ID.v_act_grv;
	ID.v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(ID, ID.v_act_vel_y, ID.x, o_wall);
	ID.v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(ID, ID.v_act_vel_x, scr_act_potypos(ID, ID.v_act_vel_y), o_wall);
} else {
	/*
	Somtimes blockID is undefined here... that shouldn't be possible, so we've definitely screwed something up.
	We will need to review this section at some point, so checking to see if blockID is undefined is a
	bandaid fix for now.
	*/
	if (state.v_state_defend_blockID != undefined) ds_list_clear(state.v_state_defend_blockID.v_block_hitboxesblocked);
	
	if (place_meeting(ID.x, ID.y + 1, o_wall)){
		ID.v_act_vel_x = 0;
		ID.v_act_vel_y = 0;
	} else scr_act_calcairvals(ID);

	if (ID.v_act_actcon.v_actcon_right && !ID.v_act_actcon.v_actcon_left) v_act_faceright = true;
	if (!ID.v_act_actcon.v_actcon_right && ID.v_act_actcon.v_actcon_left) v_act_faceright = false;
	scr_state_changesprite(ID);

	if (!ID.v_act_actcon.v_actcon_button3) {
		state.v_state_defend_continue = false;
		if (state.v_state_defend_blockID != undefined) instance_destroy(state.v_state_defend_blockID);
		state.v_state_defend_blockID = undefined;
	}
}

if (state.v_state_defend_blockID != undefined) {
	state.v_state_defend_blockID.x = scr_act_potxpos(ID, ID.v_act_vel_x);
	state.v_state_defend_blockID.y = scr_act_potypos(ID, ID.v_act_vel_y);
	
	if (ID.v_act_faceright) state.v_state_defend_blockID.x += state.v_state_defend_offset_x;
	else state.v_state_defend_blockID.x -= state.v_state_defend_offset_x;
	state.v_state_defend_blockID.y += state.v_state_defend_offset_y;
}