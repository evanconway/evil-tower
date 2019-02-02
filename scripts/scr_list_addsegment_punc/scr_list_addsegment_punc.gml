/// @description scr_list_addsegment_period(list, text, typed, chirp, font, color, punc, p_font, p_color, startnewline, centered, fx_phys, fx_colr)

/// @param list
/// @param text
/// @param typed
/// @param chirp
/// @param font
/// @param color
/// @param punc
/// @param p_font
/// @param p_color
/// @param startnewline
/// @param centered
/// @param fx_phys
/// @param fx_colr

var word = argument[1];

if (argument_count == 2) scr_list_addsegment(argument[0], word);
if (argument_count == 3) scr_list_addsegment(argument[0], word, argument[2]);
if (argument_count == 4) scr_list_addsegment(argument[0], word, argument[2], argument[3]);
if (argument_count == 5) scr_list_addsegment(argument[0], word, argument[2], argument[3], argument[4]);
if (argument_count == 6) scr_list_addsegment(argument[0], word, argument[2], argument[3], argument[4], argument[5]);
if (argument_count == 10) scr_list_addsegment(argument[0], word, argument[2], argument[3], argument[4], argument[5], argument[9]);
if (argument_count == 11) scr_list_addsegment(argument[0], word, argument[2], argument[3], argument[4], argument[5], argument[9], argument[10]);
if (argument_count == 12) scr_list_addsegment(argument[0], word, argument[2], argument[3], argument[4], argument[5], argument[9], argument[10], argument[11]);
if (argument_count == 13) scr_list_addsegment(argument[0], word, argument[2], argument[3], argument[4], argument[5], argument[9], argument[10], argument[11], argument[12]);

var t_o_period = instance_create_layer(0, 0, "Text", o_txt);
if (argument_count > 7 && argument[7] != undefined) t_o_period.v_txt_font = argument[7];
if (argument_count > 8 && argument[8] != undefined) t_o_period.v_txt_color = argument[8];
scr_txt_set_text(t_o_period, argument[6] + " ");

