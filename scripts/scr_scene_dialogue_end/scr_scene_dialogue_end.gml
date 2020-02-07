/// @description scr_scene_dialogue_end()

var textbox = v_scene_textbox;

var result = false;

if (scr_input_continue()) {
	if (textbox.v_textbox_typeto_finish) {
		textbox.v_textbox_close = true;
		v_scene_state++;
		result = true;
	} else textbox.v_textbox_typeto_finish = true;
}

return result;