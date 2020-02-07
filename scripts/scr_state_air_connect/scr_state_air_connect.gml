/// @description scr_state_air_connect(actor_id)

/// @param o_actor

var ID = argument[0];

var result = true;

if (place_meeting(ID.x, ID.y, o_wall)) result = false;
if (place_meeting(ID.x, ID.y + 1, o_wall)) result = false;

return result;
