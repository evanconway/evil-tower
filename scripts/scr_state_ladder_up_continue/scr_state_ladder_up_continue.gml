/// @description scr_state_ladder_up_continue(o_actor)
/// @param actor_id
function scr_state_ladder_up_continue() {

	var ID = argument[0];
	var actcon = ID.v_act_actcon;
	var result = false;

	if (actcon.v_actcon_up) result = true;

	// if the top edge is about to be off ladder, we need to check some things.
	if (!position_meeting(ID.x, ID.bbox_top - 1, o_ladder)) {
		if (position_meeting(ID.x, ID.bbox_top - 1, o_wall)) result = false;
	}

	if (!place_meeting(ID.x, ID.y, o_ladder)) result = false;

	if (actcon.v_actcon_pressed_down ||
		//actcon.v_actcon_pressed_left ||
		//actcon.v_actcon_pressed_right ||
		actcon.v_actcon_pressed_button1 ||
		actcon.v_actcon_pressed_button2 ||
		actcon.v_actcon_pressed_button3) {
			result = false;
			ID.v_act_vel_y = 0;
		}
	return result;



}
