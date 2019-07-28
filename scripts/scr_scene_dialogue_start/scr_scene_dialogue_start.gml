/// @description scr_scene_dialogue_start(text, portrait, portrait_index)

/// @param text
/// @param portrait_sprite
/// @param portrait_index

var textbox = v_scene_textbox;
var segments = ds_list_create();

textbox.v_textbox_triggered = true;
scr_list_addsegment_multi(segments, argument[0], true, v_scene_chirp);
scr_textbox_setsegments(textbox, segments);
textbox.v_textbox_portrait = argument[1];;
textbox.v_textbox_portrait_index = argument[2];
v_scene_state++;

segments = ds_list_create();
ds_list_destroy(segments);