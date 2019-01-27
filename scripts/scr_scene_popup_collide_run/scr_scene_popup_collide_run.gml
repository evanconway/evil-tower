/// @description scr_scene_popup_collide_run(list_run_args)

/// @param list_run_args

/*
args list of values in args:
0: scene ID
1: textbox
*/

var sceneID = ds_list_find_value(argument[0], 0);
var textbox = ds_list_find_value(argument[0], 1);

/*
For the popup scene, if there textbox isn't running, activate it.
This is the only aspect of this scene.
*/
if (!textbox.v_textbox_active) {
	textbox.v_textbox_triggered = true;
}

if (scr_input_check(true, enum_input.button1) ||
	scr_input_check(true, enum_input.select)) {
	if (textbox.v_textbox_active) {
		textbox.v_textbox_close = true;	
		sceneID.v_scene_running = false;
	}
}

// adding comment here to test github
// adding another comment here to test github
