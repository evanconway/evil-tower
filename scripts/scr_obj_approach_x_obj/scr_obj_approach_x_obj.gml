/// @description scr_obj_xapproach_obj(obja, direction, objb)
/// @param obja
/// @param objb
/// @param direction

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