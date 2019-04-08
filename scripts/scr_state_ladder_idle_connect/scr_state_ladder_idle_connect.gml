/// @description scr_state_ladder_idle_connect(o_actor)
/// @param actor_id

var ID = argument[0];
var actcon = ID.v_act_actcon;
var result = false;

if (place_meeting(x, y, o_ladder)) result = true;

//if (ID.v_act_vel_x != 0 || ID.v_act_vel_y != 0) result = false;

if (actcon.v_actcon_pressed_up ||
	actcon.v_actcon_pressed_down ||
	actcon.v_actcon_pressed_left ||
	actcon.v_actcon_pressed_right ||
	actcon.v_actcon_pressed_button1 ||
	actcon.v_actcon_pressed_button2 ||
	actcon.v_actcon_pressed_button3) result = false;

return result;