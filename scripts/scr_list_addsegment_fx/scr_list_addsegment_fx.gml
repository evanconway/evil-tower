/// @description scr_list_addsegment(list, text, color, startnewline, fxphys, fxcolr, font)

/// @param list
/// @param text
/// @param color
/// @param startnewline
/// @param fxphys
/// @param fxcolr
/// @param font

var t_segment = instance_create_layer(0, 0, "Text", o_segment);

var t_o_txt = instance_create_layer(0, 0, "Text", o_txt);
t_o_txt.v_txt_fx_phys = argument[4];
t_o_txt.v_txt_fx_colr = argument[5];
if (argument_count >= 7) t_o_txt.v_txt_font = argument[6];
scr_txt_set_text(t_o_txt, argument[1]);
scr_txt_set_colr(t_o_txt, argument[2]);
if (argument_count >= 4) t_segment.v_segment_startnewline = argument[3];
scr_segment_addtxt(t_segment, t_o_txt);

ds_list_add(argument[0], t_segment);