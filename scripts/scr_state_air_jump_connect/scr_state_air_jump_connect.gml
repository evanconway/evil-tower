/// @description scr_state_air_up_connect(actor_id)
function scr_state_air_jump_connect() {

	/// @param o_actor

	var ID = argument[0];

	var result = false;

	if (ID.v_act_actcon.v_actcon_pressed_button1) result = true;
	if (place_meeting(ID.x, ID.y, o_wall)) result = false;
	if (!place_meeting(ID.x, ID.y + 1, o_wall)) result = false;
	if (place_meeting(ID.x, ID.y - 1, o_wall)) result = false;

	return result;



}
