/// @description scr_state_ladder_idle_connect(o_actor)
/// @param actor_id

var ID = argument[0];
var actcon = ID.v_act_controller;
var result = false;

if (actcon.v_actcon_pressed_up && place_meeting(x, y, o_ladder)) result = true;

if (place_meeting(ID.x, ID.y, o_wall)) result = false;
if (!place_meeting(ID.x, ID.y + 1, o_wall)) result = false;
if (actcon.v_actcon_pressed_button1 ||
	actcon.v_actcon_pressed_button2 ||
	actcon.v_actcon_pressed_button3 ||
	actcon.v_actcon_pressed_left ||
	actcon.v_actcon_pressed_right) result = false;

return result;