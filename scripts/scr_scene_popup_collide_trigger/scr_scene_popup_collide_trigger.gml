/// @description scr_scene_popup_collide_trigger(list_trigger_args)

/// @param sceneID
/// @param list_trigger_args

/*/*
Don't forget that the arguments for scene scripts will always arrive in a list.
Also remember that the scene ID will always be the first argument in that list.
So, to reference something like the x variable from within a scene script, 
you need to do:

var my_x = ds_list_find_value(argument[0], 0);

*/

var result = false;
var sceneID = ds_list_find_value(argument[0], 0);
if (place_meeting(sceneID.x, sceneID.y, global.player)) result = true;
return result;