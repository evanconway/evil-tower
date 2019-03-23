/// @description scr_state_ladder_down_continue(o_actor)
/// @param actor_id

var ID = argument[0];
var actcon = ID.v_act_controller;
var result = false;

if (actcon.v_actcon_down) result = true;

// if the bottom edge is about to be off ladder, we need to check some things.
if (!position_meeting(ID.x, ID.bbox_bottom + 1, o_ladder)) {
	if (position_meeting(ID.x, ID.bbox_bottom + 1, o_wall)) result = false;
	if (!place_meeting(ID.x, ID.y + 1, o_ladder)) result = false;
}

return result;
