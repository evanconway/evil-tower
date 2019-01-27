/// @description scr_setup_txt(o_txt, text, font, color, fx_phys, fx_colr)

/// @param o_txt
/// @param text
/// @param font
/// @param color
/// @param fx_phys
/// @param fx_colr

var setuptxt_i = 1;
if (argument[setuptxt_i] != global.novalue) argument[0].v_txt_text = argument[setuptxt_i++];
if (argument[setuptxt_i] != global.novalue) argument[0].v_txt_font = argument[setuptxt_i++];
if (argument[setuptxt_i] != global.novalue) argument[0].v_txt_color = argument[setuptxt_i++];
if (argument[setuptxt_i] != global.novalue) argument[0].v_txt_fx_phys = argument[setuptxt_i++];
if (argument[setuptxt_i] != global.novalue) argument[0].v_txt_fx_colr = argument[setuptxt_i++];

draw_set_font(argument[0].v_txt_font);
argument[0].v_txt_width = string_width(argument[0].v_txt_text);
argument[0].v_txt_height = string_height(argument[0].v_txt_text);