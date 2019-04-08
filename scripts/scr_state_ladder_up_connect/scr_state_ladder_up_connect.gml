/// @description scr_state_ladder_up_connect(o_actor)

/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;
var actcon = ID.v_act_actcon;
var result = false;

if (actcon.v_actcon_up) result = true;

if (actcon.v_actcon_down ||
	actcon.v_actcon_pressed_left ||
	actcon.v_actcon_pressed_right ||
	actcon.v_actcon_button1 ||
	actcon.v_actcon_button2 ||
	actcon.v_actcon_button3) result = false;
if (!place_meeting(ID.x, ID.y, o_ladder)) result = false;

return result;
