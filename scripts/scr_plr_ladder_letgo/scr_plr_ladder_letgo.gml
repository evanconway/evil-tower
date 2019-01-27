/// @description scr_plr_ladder_letgo(player)
/// @param player
		
if (argument[0].v_plr_ladder_canjump) {
	if (scr_input_check(true, enum_input.button1)) {
		if (place_meeting(argument[0].x, argument[0].y, o_wall)) {
			scr_plr_setstate(argument[0], enum_plr_state.ladder_fall);
			//if (scr_obj_approachedgeofon_obj_dist_y_at_x(argument[0], o_ladder, 1, argument[0].x) != 0) scr_plr_setstate(argument[0], enum_plr_state.ladder_fall);
		} else {
			if (place_meeting(argument[0].x, argument[0].y + 1, o_wall)) scr_plr_setstate(argument[0], enum_plr_state.gnd_idle, s_plr_gnd_static_back);
			else scr_plr_setstate(argument[0], enum_plr_state.air_dn);
		}
	}
	if (argument[0].v_act_input_x != 0 && 
	!place_meeting(argument[0].x, argument[0].y, o_wall) && 
	place_meeting(argument[0].x, argument[0].y + 1, o_wall)) scr_plr_setstate(argument[0], enum_plr_state.gnd_run);
	#region release ladders with left right input
	/*
	if (v_act_input_x != 0)//
	{
		if (v_act_input_x > 0) v_act_faceright = true;
		else v_act_faceright = false;
		if (place_meeting(x, y, o_wall))
		{
			if (scr_obj_approachedgeofon_obj_dist_y_at_x(id, o_ladder, 1, x) != 0) scr_plr_setstate(id, enum_plr_state.ladder_fall);
				
		} else
		{
			if (place_meeting(x, y + 1, o_wall)) scr_plr_setstate(id, enum_plr_state.gnd_run);
			else scr_plr_setstate(id, enum_plr_state.ladder_fall);
		}
	}
	*/
	#endregion
}