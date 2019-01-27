/// @description scr_act_potypos(o_actor, movey)
/// @param o_actor
/// @param movey

//returns what the y position would be given ymove (potential y position)
if (argument[1] != 0)
{
	var return_value = 0;
	var curr_y_pos = v_act_input_y_start + v_act_ymovedist;
	var pot_ymovedist = v_act_ymovedist + argument[1];
	var potential_y_pos = v_act_input_y_start + pot_ymovedist;
	if (potential_y_pos >= curr_y_pos) return_value = floor(potential_y_pos);
	else return_value = ceil(potential_y_pos);
	return return_value;
} else return y;