/// @description scr_list_addsegment(list, text, color, startnewline)

/// @param list
/// @param text
/// @param color
/// @param startnewline

var t_segment = instance_create_layer(0, 0, "Text", o_segment);

var t_o_txt = instance_create_layer(0, 0, "Text", o_txt);
scr_txt_set_text(t_o_txt, argument[1]);
scr_txt_set_colr(t_o_txt, argument[2]);

if (argument_count >= 4) {
	t_segment.v_segment_startnewline = argument[3];
}

scr_segment_addtxt(t_segment, t_o_txt);

ds_list_add(argument[0], t_segment);