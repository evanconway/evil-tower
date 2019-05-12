/// @description scr_state_slam_run(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

switch (state.v_state_slam_stage) {
	case 0: // freeze in air
	if (state.v_state_count <= 0) {
		state.v_state_slam_stage++;
		
	} else state.v_state_count--;
	break;
	case 1: // move down
	ID.v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(ID, ID.v_act_vel_y_max, ID.x, o_wall);
	if (place_meeting(x, scr_act_potypos(ID, ID.v_act_vel_y), o_wall)) {
		state.v_state_count = 120; // how many frames should we use?
		state.v_state_slam_stage++;
		scr_camera_shake(0, 5);
	}
	break;
	case 2: // freeze on ground
	if (state.v_state_count <= 0) state.v_state_slam_finished = true;
	else state.v_state_count--;
	break;
}
