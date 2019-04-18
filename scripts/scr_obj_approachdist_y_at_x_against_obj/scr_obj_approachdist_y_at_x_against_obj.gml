/// @description scr_obj_approachdist_y_at_x_against_obj(obja, ymove, xpos, objb)
/// @param obja
/// @param ymove
/// @param xpos
/// @param objb

/*
Beware! Place_meeting makes a check for the object calling this script. So far, every 
time we've called this script, we've called the script from code of obja. If we call 
this from somewhere other than obja code, we'll be using positions of obja, but 
checking for the object we called from. 
*/

var obja = argument0;
var ymove = argument1;
var xpos = argument2;
var objb = argument3;

var distance = 0;

if (ymove != 0)
{
	while (!place_meeting(xpos, obja.y + sign(ymove) + distance, objb))
	{
		distance += sign(ymove);
		if (abs(distance) > abs(ymove)) return ymove;
	}
}

return distance; 