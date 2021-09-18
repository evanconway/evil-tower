/// @description scr_state_ladder_down_continue_postrun(o_actor)
/// @param actor_id
function scr_state_ladder_down_continue_postrun() {

	var ID = argument[0];
	var result = false;
	if (place_meeting(ID.x, ID.y, o_ladder)) result = true;
	var edgeonladder = false;
	var edgeonwall = false;
	for (var i = 0; i <= ID.bbox_right - ID.bbox_left; i++) {
		if (position_meeting(ID.bbox_left + i, ID.bbox_bottom, o_ladder)) edgeonladder = true;
		if (position_meeting(ID.bbox_left + i, ID.bbox_bottom, o_wall)) edgeonwall = true;
	}
	if (edgeonwall && !edgeonladder) result = false;
	return result;


}
