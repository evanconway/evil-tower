/// @description scr_list_addsegment_blankline(list)

/// @param list

/*
this script adds a blank segment with startnewline set to true. 
It correctly figures out height values based on font. 
*/

var t_segment = instance_create_layer(0, 0, "Text", o_segment);
t_segment.v_segment_startnewline = true;
var t_o_txt = instance_create_layer(0, 0, "Text", o_txt);
scr_txt_set_text(t_o_txt, "");
draw_set_font(t_o_txt.v_txt_font);
t_o_txt.v_txt_width = string_width(t_o_txt.v_txt_text);
t_o_txt.v_txt_height = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
scr_segment_addtxt(t_segment, t_o_txt);
ds_list_add(argument[0], t_segment);