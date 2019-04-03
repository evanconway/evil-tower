/// @description scr_state_air_up_connect(actor_id)

/// @param o_actor

var ID = argument[0];

var result = false;

if (ID.v_act_controller.v_actcon_pressed_button1 || ID.v_act_vel_y < 0) result = true;
if (place_meeting(ID.x, ID.y, o_wall)) result = false;
//if (!place_meeting(ID.x, ID.y + 1, o_wall)) result = false;
if (place_meeting(ID.x, ID.y - 1, o_wall)) result = false;

return result;
