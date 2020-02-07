/// @description scr_state_gnd_attack_connect(actor_id)

/// @param o_actor

var ID = argument[0];
var actcon = ID.v_act_actcon;

var result = false

if (actcon.v_actcon_pressed_button2) result = true;
if (actcon.v_actcon_pressed_button1) result = false;
if (actcon.v_actcon_pressed_button3) result = false;
if (place_meeting(ID.x, ID.y, o_wall)) result = false;
//if (!place_meeting(ID.x, ID.y + 1, o_wall)) result = false;

return result;
