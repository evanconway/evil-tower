/// @description scr_obj_yapproach_obj(obja, direction, objb)
/// @param obja
/// @param objb
/// @param direction
function scr_obj_approach_y_obj(argument0, argument1, argument2) {

	if (argument1 != 0)
	{
		while (!place_meeting(argument0.x, argument0.y + sign(argument1), argument2))
		{
			argument0.y += sign(argument1);
		}
		return true;
	} else
	{
		return false;
	}


}
