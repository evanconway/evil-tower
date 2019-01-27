/// @description scr_obj_approachdist_y_against_obj(obja, ymove, xpos, objb)
/// @param obja
/// @param ymove
/// @param xpos
/// @param objb

var distance = 0;

if (argument1 != 0)
{
	while (!place_meeting(argument2, argument0.y + sign(argument1) + distance, argument3))
	{
		distance += sign(argument1);
		if (abs(distance) > abs(argument1)) return argument1;
	}
}

return distance; 