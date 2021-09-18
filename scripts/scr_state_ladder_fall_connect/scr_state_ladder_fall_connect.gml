/// @description scr_state_ladder_fall_connect(o_actor)
/// @param actor_id
function scr_state_ladder_fall_connect() {

	var ID = argument[0];
	var result = false;

	if (place_meeting(ID.x, ID.y, o_ladder)) result = true;

	/*
	The whole reason for having a fall state specifically for ladders is because
	ladders can move actors through walls. So if they actor is not in a wall, 
	there is no reason for this state.
	*/
	if (!place_meeting(ID.x, ID.y, o_wall)) result = false;

	var edgeonladder = false;
	var edgeonwall = false;
	for (var i = 0; i <= ID.bbox_right - ID.bbox_left; i++) {
		if (position_meeting(ID.bbox_left + i, ID.bbox_bottom + 1, o_ladder)) edgeonladder = true;
		if (position_meeting(ID.bbox_left + i, ID.bbox_bottom + 1, o_wall)) edgeonwall = true;
	}
	if (edgeonwall && !edgeonladder) result = false;

	return result;


}
