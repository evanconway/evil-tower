/// @description scr_obj_approachedgeofon_obj_dist_y_at_x(obja, objb, ymove, x)
/// @param obja
/// @param objb
/// @param ymove
/// @param x
function scr_obj_approachedgeofon_obj_dist_y_at_x(argument0, argument1, argument2, argument3) {

	var distance = 0
	if (argument2 != 0)
	{
		var obja_bbox_side = 0;
		if (argument2 > 0) obja_bbox_side = argument0.bbox_bottom;
		else obja_bbox_side = argument0.bbox_top;
		while (position_meeting(argument3, obja_bbox_side + distance + sign(argument2), argument1))
		{
			distance += sign(argument2);
			if (abs(distance) > abs(argument2)) return argument2;
		}
		return distance;
	} else return 0;


}
