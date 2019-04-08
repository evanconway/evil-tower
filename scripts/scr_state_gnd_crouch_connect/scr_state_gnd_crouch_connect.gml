/// @description scr_state_gnd_crouch_connect(actor_id)

/// @param o_actor

var ID = argument[0];
var actcon = ID.v_act_actcon;

var result = false

if (actcon.v_actcon_pressed_down) result = true;
//if (actcon.v_actcon_right) result = false;
//if (actcon.v_actcon_left) result = false;
if (place_meeting(ID.x, ID.y, o_wall)) result = false;
if (!place_meeting(ID.x, ID.y + 1, o_wall)) result = false;

return result;