/// @description scr_state_wall_stick_connect(actor_id, wallstick_id)

/// @param o_actor
/// @param o_state

/*
Actor must be in air, not colliding with a wall, pressing left or right in the direction of an o_wall, 
that wall is within wallstick_dist, pressed jump, and the actor has not jumped off that wall yet while in 
air.
*/

var result = false;
var ID = argument[0];
var actcon = ID.v_act_actcon;
var state = argument[1];
var dist = state.v_state_wall_stick_dist;
var dsign = 0;
var withindist = false;

if (actcon.v_actcon_pressed_button1) {
	if (actcon.v_actcon_right && !actcon.v_actcon_left) || (actcon.v_actcon_left && !actcon.v_actcon_right) {
		result = true;
		if (actcon.v_actcon_right) dsign = 1;
		else dsign = -1;
	}
}

if (result) {
	if (place_meeting(ID.x, ID.y, o_wall) || place_meeting(ID.x, ID.y + 1, o_wall)) result = false;
}

if (result) {
	for (var i = 1; i <= dist; i++) {
		if (place_meeting(ID.x + dsign*i, ID.y, o_wall)) {
			withindist = true;
			i = dist;
		}
	}
	result = withindist;
}

if (result) {
	if (dsign > 0) if (state.v_state_wall_stick_Rwall) result = false;
	if (dsign < 0) if (state.v_state_wall_stick_Lwall) result = false;
}

return result;
