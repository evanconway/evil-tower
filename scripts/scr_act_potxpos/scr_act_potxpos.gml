/// @description scr_act_potxpos(o_actor, xvel)
/// @param o_actor
/// @param xvel
function scr_act_potxpos() {

	//returns what the x position would be given xmove (potential x position)
	if (argument[1] != 0)
	{
		var return_value = 0;
		var curr_x_pos = v_act_input_x_start + v_act_xmovedist;
		var pot_xmovedist = v_act_xmovedist + argument[1];
		var potential_x_pos = v_act_input_x_start + pot_xmovedist;
		if (potential_x_pos >= curr_x_pos) return_value = floor(potential_x_pos);
		else return_value = ceil(potential_x_pos);
		return return_value;
	} else return x;


}
