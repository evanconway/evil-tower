/// @description scr_obj_yapproach_obj(obja, direction, objb)
/// @param obja
/// @param objb
/// @param direction

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