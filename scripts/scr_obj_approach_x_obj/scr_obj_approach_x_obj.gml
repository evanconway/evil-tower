/// @description scr_obj_xapproach_obj(obja, direction, objb)
/// @param obja
/// @param objb
/// @param direction
function scr_obj_approach_x_obj(argument0, argument1, argument2) {

	if (argument1 != 0)
	{
		while (!place_meeting(argument0.x + sign(argument1), argument0.y, argument2))
		{
			argument0.x += sign(argument1);
		}
		return true;
	} else
	{
		return false; 
	}


}
