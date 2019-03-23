/// @description scr_obj_approachedgeof_y_whiletouch_obj(obja, ymove, objb)
/// @param obja
/// @param ymove
/// @param objb

/*
Returns the distance to move obja closer to edge of objb with y change. 
*/

// remember that positive y vel moves down

var obja = argument[0];
var ymove = argument[1];
var objb = argument[2];
var result = false;

if (ymove != 0) {
	if (ymove > 0) {
		while (position_meeting(obja.x, obja.bbox_bottom + sign(ymove), objb))
		{
			obja.y += sign(ymove);
		}
		result = true;
	} else {
		while (position_meeting(obja.x, obja.bbox_top + sign(ymove), objb)) {
			obja.y += sign(ymove);
		}
		result = true;
	}
} else result = false; 

return result;
