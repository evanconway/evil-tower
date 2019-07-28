/// @description scr_state_ram_connect(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;
var actcon = ID.v_act_actcon;

var result = false;

with (ID) {
	if (actcon.v_actcon_button2 && actcon.v_actcon_left && !place_meeting(x - 1, y, o_wall)) result = true;
	if (actcon.v_actcon_button2 && actcon.v_actcon_right && !place_meeting(x + 1, y, o_wall)) result = true;
	if (!place_meeting(x, y + 1, o_wall)) result = false;
}


return result;
