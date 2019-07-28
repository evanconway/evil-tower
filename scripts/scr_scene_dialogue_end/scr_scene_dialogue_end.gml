/// @description scr_scene_dialogue_end()

var textbox = v_scene_textbox;

if (scr_input_continue()) {
	if (textbox.v_textbox_typeto_finish) {
		textbox.v_textbox_close = true;
		v_scene_state++;
	} else textbox.v_textbox_typeto_finish = true;
}