/// @description scr_scene_boss_trig(args)

/// @param(args)

//var ID = ds_list_find_value(argument[0], 0);
var result = false;

if (place_meeting(x, y, o_player)) result = true;

return result;