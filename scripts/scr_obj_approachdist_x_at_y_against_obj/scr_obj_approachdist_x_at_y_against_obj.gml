/// @description scr_obj_approachdist_x_at_y_against_obj(obja, xmove, ypos, objb)
/// @param obja
/// @param xmove
/// @param ypos
/// @param objb
function scr_obj_approachdist_x_at_y_against_obj(argument0, argument1, argument2, argument3) {

	var distance = 0;

	if (argument1 != 0)
	{
		while (!place_meeting(argument0.x + sign(argument1) + distance, argument2, argument3))
		{
			distance += sign(argument1);
			if (abs(distance) > abs(argument1)) return argument1;
		}
	}

	return distance; 


}
