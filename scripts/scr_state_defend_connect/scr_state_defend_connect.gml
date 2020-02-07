/// @description scr_state_defend_connect(o_actor)
/// @param actor_id

var ID = argument[0];
var result = false;

if (ID.v_act_actcon.v_actcon_button3) result = true;
if (place_meeting(ID.x, ID.y, o_wall)) result = false;

return result;