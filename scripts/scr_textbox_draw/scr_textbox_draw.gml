/// @description scr_textbox_draw(textboxID)

/// @param textboxID

var t_x = 0;
var t_y = 0;
if (v_textbox_isgui) {
	t_x = x - floor(v_textbox_width/2);
	t_y = y;
} else {
	t_x = x - floor(v_textbox_width/2) + v_textbox_x_offset;
	t_y = bbox_top + v_textbox_y_offset;
}

var ID = argument[0];//may not need this

// x and y of the box is treated as top center. 

if (v_textbox_visible) && (global.static_visible) {
	if (v_textbox_width != 0 || v_textbox_height != 0) {
		//box
		draw_set_alpha(1);
		draw_set_color(v_textbox_bordercolor);
		draw_rectangle(t_x, t_y, t_x + v_textbox_width, t_y + v_textbox_height, false);	
		draw_set_color(v_textbox_bodycolor);
		draw_rectangle(t_x + v_textbox_border_width, t_y + v_textbox_border_width,
		t_x + v_textbox_width - v_textbox_border_width, t_y + v_textbox_height - v_textbox_border_width, false);
	}
	
	//text
	if (v_textbox_width == v_textbox_width_max) && (v_textbox_height == v_textbox_height_max) {
		var start_x = t_x + v_textbox_border_width + v_textbox_xpad;
		var start_y = t_y + v_textbox_border_width;
		
		//text drawn fromt top left down
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		var curs_x = start_x;
		var curs_y = start_y;
		
		var biggest_segment_height = 0;
		
		if (v_textbox_lines != undefined && ds_list_size(v_textbox_lines) > 0) {
			// draw the lines
			for (var i1 = 0; i1 <= v_textbox_typeto_line; i1++) {
				var line = ds_list_find_value(v_textbox_lines, i1);
				biggest_segment_height = 0;
				curs_x = start_x;
				var segment_limit = ds_list_size(line) - 1;
				if (i1 == v_textbox_typeto_line) segment_limit = v_textbox_typeto_sgmt;
				for (var i2 = 0; i2 <= segment_limit; i2++) {
					var t_segment = ds_list_find_value(line, i2);
					if (t_segment.v_segment_height > biggest_segment_height) biggest_segment_height = t_segment.v_segment_height;
					var txt_limit = ds_list_size(t_segment.v_segment_txts) - 1;
					if (i1 == v_textbox_typeto_line && i2 == segment_limit) txt_limit = v_textbox_typeto_otxt;
					for (var i3 = 0; i3 <= txt_limit; i3++) {
						var t_txt = ds_list_find_value(t_segment.v_segment_txts, i3);
						draw_set_alpha(t_txt.v_txt_alpha);
						draw_set_font(t_txt.v_txt_font);
						draw_set_color(t_txt.v_txt_color);
						var char_limit = string_length(t_txt.v_txt_text);
						if (i1 == v_textbox_typeto_line && i2 == segment_limit && i3 == v_textbox_typeto_otxt) char_limit = v_textbox_typeto_char;
						var text_to_draw = string_copy(t_txt.v_txt_text, 1, char_limit);
						draw_text(curs_x + t_txt.v_txt_x_ofst, curs_y + t_txt.v_txt_y_ofst, text_to_draw);
						curs_x += t_txt.v_txt_width;
					}
				}
				curs_y += biggest_segment_height;
			}
		}
	}
}