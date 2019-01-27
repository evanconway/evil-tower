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

var collide_trigger_result = false;
var cpt_sceneID = ds_list_find_value(argument[0], 0);
if (place_meeting(cpt_sceneID.x, cpt_sceneID.y, o_player)) collide_trigger_result = true;
return collide_trigger_result;