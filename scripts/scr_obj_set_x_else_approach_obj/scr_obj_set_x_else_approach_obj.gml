/// @description scr_obj_setpos_else_approach_obj(obja, newx, objb)
/// @param obja
/// @param newx
/// @param objb

if (place_meeting(argument1, argument0.y, argument2))
{
	scr_obj_approach_x_obj(argument0, argument1, argument2);
	return false;
} else
{
	argument0.x = argument1;
	return true;
}