/// @description scr_state_gnd_crouch_continue(actor_id)

/// @param o_actor

var ID = argument[0];
var actcon = ID.v_act_actcon;

var result = false

if (actcon.v_actcon_down) result = true;
if (actcon.v_actcon_pressed_left) result = false;
if (actcon.v_actcon_pressed_right) result = false;
if (actcon.v_actcon_pressed_up) result = false;
if (actcon.v_actcon_pressed_button1) result = false;
if (actcon.v_actcon_pressed_button2) result = false;
if (actcon.v_actcon_pressed_button3) result = false;
if (ID.v_act_vel_x != 0) result = false;
if (ID.v_act_vel_y != 0) result = false;
if (place_meeting(ID.x, ID.y, o_wall)) result = false;
if (!place_meeting(ID.x, ID.y + 1, o_wall)) result = false;

return result;