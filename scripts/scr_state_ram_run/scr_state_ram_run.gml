/// @description scr_state_ram_run(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

var xVel = 0;

switch (state.v_state_ram_stage) {
	case 0: // ramming
	if (state.v_state_ram_faceright) {
		xVel = ID.v_act_vel_x_max;
		ID.sprite_index = state.v_state_sprite;
	} else {
		xVel = ID.v_act_vel_x_max * -1;
		ID.sprite_index = state.v_state_sprite_left;
	}
	// ram fx
	state.v_state_count--;
	if (state.v_state_count <= 0) {
		if (state.v_state_ram_fx != undefined) instance_create_layer(ID.x, ID.y, "Hitboxes", state.v_state_ram_fx);
		state.v_state_count = state.v_state_count_max;
	}
	xVel = scr_obj_approachdist_x_at_y_against_obj(ID, xVel, ID.y, o_wall);
	var touchWall = false
	var potX = scr_act_potxpos(ID, xVel);
	with (ID) {
		if (state.v_state_ram_faceright && place_meeting(potX + 1, y, o_wall)) touchWall = true;
		if (!state.v_state_ram_faceright && place_meeting(potX - 1, y, o_wall)) touchWall = true;
	}
	if (touchWall) {
		scr_camera_shake(5 * sign(xVel), 0);
		scr_playsfx(snd_bigland);
		state.v_state_count = state.v_state_ram_rest;
		state.v_state_ram_stage++;
	}
	break;
	case 1: // hit wall and waiting
	if (state.v_state_ram_faceright) ID.sprite_index = state.v_state_ram_donesprite;
	else ID.sprite_index = state.v_state_ram_donesprite_left;
	state.v_state_count--;
	if (state.v_state_count <= 0) state.v_state_ram_finished = true;
	break;
}

ID.v_act_vel_x = xVel;
ID.v_act_vel_y = 0;
