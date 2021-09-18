/// @description scr_obj_setpos_else_approach_obj(obja, newy, objb)
/// @param obja
/// @param newy
/// @param objb
function scr_obj_set_y_else_approach_obj(argument0, argument1, argument2) {

	if (place_meeting(argument0.x, argument1, argument2))
	{
		scr_obj_approach_y_obj(argument0, argument1, argument2);
		return false;
	} else
	{
		argument0.y = argument1;
		return true;
	}


}
