/// @description scr_state_ladder_down_continue_postrun(o_actor)
/// @param actor_id

var ID = argument[0];
var result = false;
if (place_meeting(ID.x, ID.y, o_ladder)) result = true;
return result;