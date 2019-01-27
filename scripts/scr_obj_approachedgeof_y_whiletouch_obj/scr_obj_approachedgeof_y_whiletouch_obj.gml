/// @description scr_obj_approachedgeof_y_whiletouch_obj(obja, ymove, objb)
/// @param obja
/// @param ymove
/// @param objb

if (argument1 != 0)
{
	if (argument1 > 0)
	{
		while (position_meeting(argument0.x, argument0.bbox_bottom + sign(argument1), argument2))
		{
			argument0.y += sign(argument1);
		}
		return true;
	} else
	{
		while (position_meeting(argument0.x, argument0.bbox_top + sign(argument1), argument2))
		{
			argument0.y += sign(argument1);
		}
		return true;
	}
} else
{
	return false; 
}