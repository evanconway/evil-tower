/// @description scr_list_addsegment(list, text, typed, chirp, font, color, startnewline, centered, fx_phys, fx_colr)

/// @param list
/// @param text
/// @param typed
/// @param chirp
/// @param font
/// @param color
/// @param startnewline
/// @param centered
/// @param fx_phys
/// @param fx_colr

var t_o_txt = instance_create_layer(0, 0, "Text", o_txt);
if (argument_count > 3 && argument[3] != undefined) t_o_txt.v_txt_chirp = argument[3];
if (argument_count > 4 && argument[4] != undefined) t_o_txt.v_txt_font = argument[4];
if (argument_count > 5 && argument[5] != undefined) t_o_txt.v_txt_color = argument[5];
if (argument_count > 8 && argument[8] != undefined) t_o_txt.v_txt_fx_phys = argument[8];
if (argument_count > 9 && argument[9] != undefined) t_o_txt.v_txt_fx_phys = argument[9];
scr_txt_set_text(t_o_txt, argument[1]);
var t_segment = instance_create_layer(0, 0, "Text", o_segment);
scr_segment_addtxt(t_segment, t_o_txt);
if (argument_count > 2 && argument[2] != undefined) t_segment.v_segment_typed = argument[2];
if (argument_count > 6 && argument[6] != undefined) t_segment.v_segment_startnewline = argument[6];
if (argument_count > 7 && argument[7] != undefined) t_segment.v_segment_centered = argument[7];
ds_list_add(argument[0], t_segment);