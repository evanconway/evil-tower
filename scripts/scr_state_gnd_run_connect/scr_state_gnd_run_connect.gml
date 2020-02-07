/// @description scr_state_gnd_run_connect(actor_id)

/// @param actor_id

var result = false;
var ID = argument[0];
var act_controller = ID.v_act_actcon;

if ((act_controller.v_actcon_left && !act_controller.v_actcon_right)
|| (act_controller.v_actcon_right && !act_controller.v_actcon_left)) result = true;

if (act_controller.v_actcon_right && place_meeting(ID.x + 1, ID.y, o_wall)) result = false;
if (act_controller.v_actcon_left && place_meeting(ID.x - 1, ID.y, o_wall)) result = false;

if (place_meeting(ID.x, ID.y, o_wall)) result = false;
if (!place_meeting(ID.x, ID.y + 1, o_wall)) result = false;

return result;
