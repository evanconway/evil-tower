/// @description scr_scene_popup_collide_settext(o_scene_popup, text)

/// @param o_scene_popup
/// @param text

// make a list, then automatically add segments to that list with the script
var t_chunk = ds_list_create();
scr_list_addsegment_multi(t_chunk, argument[1], c_white);

argument[0].v_scene_pc_textbox.v_textbox_segments = t_chunk;

// now add this list, the chunk, to the textbox of the popup scene
//scr_textbox_addchunk(argument[0].v_scene_pc_textbox, t_chunk);

// and destroy the temporary list
t_chunk = ds_list_create();
ds_list_destroy(t_chunk);