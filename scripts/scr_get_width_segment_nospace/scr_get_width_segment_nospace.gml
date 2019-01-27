/// @description scr_get_width_segment_nospace(segment)

/// @param segment

var nospace_segment_txts = argument[0].v_segment_txts;
var nospace_last_txt = ds_list_find_value(nospace_segment_txts, ds_list_size(nospace_segment_txts) - 1);
draw_set_font(nospace_last_txt.v_txt_font);
var result = argument[0].v_segment_width;
var nospace_last_char = string_char_at(nospace_last_txt.v_txt_text, string_length(nospace_last_txt.v_txt_text));
if (nospace_last_char == " ") result -= string_width(" ");
return result;