/// @description scr_scene_popup_collide_run(list_run_args)
function scr_scene_popup_collide_run() {

	/// @param list_run_args

	/*
	args list of values in args:
	0: scene ID
	1: textbox
	*/

	var sceneID = ds_list_find_value(argument[0], 0);
	var textbox = sceneID.v_scene_pc_textbox; //ds_list_find_value(argument[0], 1);
	var buttonpressed = sceneID.v_scene_pc_buttonpressed; //ds_list_find_value(argument[0], 2);

	//For the popup scene, if there textbox isn't running, activate it.
	if (textbox.v_textbox_state == enum_textbox_state.off && !buttonpressed) {
		textbox.v_textbox_triggered = true;
	}

	if (scr_input_check(true, enum_input.button1) ||
		scr_input_check(true, enum_input.select)) {
		if (textbox.v_textbox_state == enum_textbox_state.active) {
			textbox.v_textbox_close = true;
			sceneID.v_scene_pc_buttonpressed = true;
		}
	}

	if (textbox.v_textbox_state == enum_textbox_state.off && sceneID.v_scene_pc_buttonpressed) {
		sceneID.v_scene_running = false;
	}



}
