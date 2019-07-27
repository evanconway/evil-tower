/// @description scr_state_slam_run(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

var slamSpeed = ID.v_act_vel_y_max * 2;

switch (state.v_state_slam_stage) {
	case 0: // freeze in air
	ID.v_act_vel_x = 0;
	ID.v_act_vel_y = 0;
	if (state.v_state_count <= 0) {
		state.v_state_slam_stage++;
		scr_playsfx(snd_bigfall);
		if (ID.v_act_faceright && state.v_state_slam_sprite_dn != undefined) ID.sprite_index = state.v_state_slam_sprite_dn;
		if (!ID.v_act_faceright && state.v_state_slam_sprite_dn_left != undefined) ID.sprite_index = state.v_state_slam_sprite_dn_left;
	} else state.v_state_count--;
	break;
	case 1: // move down
	var touchedGround = false;
	with (ID) {
		if (place_meeting(x, y + 1, o_wall)) touchedGround = true;
		else ID.v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(ID, slamSpeed, ID.x, o_wall);	
	}
	if (touchedGround) {
		ID.v_act_vel_y = 0;
		state.v_state_count = 30; // how many frames should we use?
		state.v_state_slam_stage++;
		scr_camera_shake(0, 5);
		audio_stop_sound(snd_bigfall);
		scr_playsfx(snd_bigland);
		if (ID.v_act_faceright && state.v_state_slam_sprite_land != undefined) ID.sprite_index = state.v_state_slam_sprite_land;
		if (!ID.v_act_faceright && state.v_state_slam_sprite_land_left != undefined) ID.sprite_index = state.v_state_slam_sprite_land_left;
	}
	break;
	case 2: // freeze on ground
	if (state.v_state_count <= 0) state.v_state_slam_finished = true;
	else state.v_state_count--;
	break;
}
