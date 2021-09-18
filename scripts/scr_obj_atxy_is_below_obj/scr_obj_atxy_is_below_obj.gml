/// @description scr_obj_atxy_is_below_obj(obja, x, y, objb)
/// @param obja
/// @param x
/// @param y
/// @param objb
function scr_obj_atxy_is_below_obj(argument0, argument1, argument2, argument3) {

	var old_x = argument0.x;
	var old_y = argument0.y;
	var below = false;

	argument0.x = argument1;
	argument0.y = argument2;

	for (i = argument0.bbox_left; i <= argument0.bbox_right; i++)
	{
		if (position_meeting(i, argument0.bbox_top - 1, argument3)) below = true;
	}

	argument0.x = old_x;
	argument0.y = old_y;

	return below;


}
