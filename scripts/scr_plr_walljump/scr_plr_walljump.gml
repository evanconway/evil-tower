/// @description scr_plr_walljump(playerID)

/// @param playerID

var ID = argument[0];

//check for wall jump, otherwise continue with all other state checks
var touch_wall = false;
var wall_x_dist = 0;
for (var i = 0; i <= ID.v_plr_walljump_dist; i++) {
	if (place_meeting(x + (sign(ID.v_act_input_x) * i), y, o_wall)) {
		touch_wall = true;
		wall_x_dist = (i - 1) * sign(ID.v_act_input_x);//minus 1 to prevent entering wall
		i = ID.v_plr_walljump_dist;
	}
}

if (scr_input_check(true, enum_input.button1) && touch_wall && 
(ID.v_act_input_x != ID.v_plr_walljump_prev || ID.v_plr_jump_committime <= 0)) {		
	ID.v_plr_walljump_prev = ID.v_act_input_x;//disables immediate wall jump on same wall
	ID.v_act_vel_x = wall_x_dist;
	ID.v_act_vel_y = 0;
	scr_plr_setstate(ID, enum_plr_state.wall_slide);
	scr_playsfx(snd_tick);
}