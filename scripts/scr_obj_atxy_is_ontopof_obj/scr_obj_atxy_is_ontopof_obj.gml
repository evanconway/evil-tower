/// @description scr_obj_atxy_is_ontopof_obj(obja, x, y, objb)
/// @param obja
/// @param x
/// @param y
/// @param objb

var old_x = argument0.x;//we need to actually change the x,y here so we can get the correct bbox coordinates. 
var old_y = argument0.y;
var ontop = false;

argument0.x = argument1;
argument0.y = argument2;

for (i = argument0.bbox_left; i <= argument0.bbox_right; i++)
{
	if (position_meeting(i, argument0.bbox_bottom + 1, argument3)) ontop = true;
}

argument0.x = old_x;
argument0.y = old_y;

return ontop;