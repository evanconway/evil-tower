/// @description scr_state_air_dn_connect(actor_id)

/// @param o_actor

var result = false;
var ID = argument[0];

if (ID.v_act_vel_y >= 0) result = true;
if (place_meeting(ID.x, ID.y, o_wall)) result = false;
if (place_meeting(ID.x, ID.y + 1, o_wall)) result = false;

return result;
