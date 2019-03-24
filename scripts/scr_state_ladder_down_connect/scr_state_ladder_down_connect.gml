/// @description scr_state_ladder_down_connect(o_actor)

/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;
var actcon = ID.v_act_controller;
var result = false;


// To use pressed_down or just down? Pressed_down demands more precise inputs from the player.
if (actcon.v_actcon_down && place_meeting(ID.x, ID.y, o_ladder)) result = true;

// Actors need to be able to climb down ladders when they're on top of a wall with a ladder descending it.
if (actcon.v_actcon_down && place_meeting(ID.x, ID.y + 1, o_ladder)) result = true;

// Entire bottom edge must be checked to prevent entering climb down state when on ground
var laddertouched = false;
var walltouched = false
for (var i = 0; i <= ID.bbox_right - bbox_left; i++) {
	if (position_meeting(ID.bbox_left + i, ID.bbox_bottom + 1, o_ladder)) laddertouched = true;
	if (position_meeting(ID.bbox_left + i, ID.bbox_bottom + 1, o_wall)) walltouched = true;
}

if (!laddertouched && walltouched) result = false;

if (actcon.v_actcon_up ||
	actcon.v_actcon_pressed_left ||
	actcon.v_actcon_pressed_right ||
	actcon.v_actcon_button1 ||
	actcon.v_actcon_button2 ||
	actcon.v_actcon_button3) result = false;

return result;
