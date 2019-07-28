/// @description scr_scene_dialogue_next(text, portrait_index)

/// @param text
/// @param portrait_index

var segments = ds_list_create();
var textbox = v_scene_textbox;

if (scr_input_continue()) {
	if (textbox.v_textbox_typeto_finish) {
		scr_list_addsegment_multi(segments,argument[0],true, v_scene_chirp);
		scr_textbox_setsegments(textbox, segments);
		textbox.v_textbox_portrait_index = argument[1];
		v_scene_state++;
	} else textbox.v_textbox_typeto_finish = true;
}

segments = ds_list_create();
ds_list_destroy(segments);