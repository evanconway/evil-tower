/// @description scr_textbox_draw(textboxID)

/// @param textboxID

//text normally draws onto border
var y_pad = 4;//add a bit to the bottom of the box;

var t_x = x - floor(v_textbox_width/2) + v_textbox_x_offset;
var t_y = bbox_top + v_textbox_y_offset;

/*
For some reason we have elected to to draw regardless of pop up or not.
We could totally have a box that isn't supposed to popup. How are we
handling that?? This will have to be revisited.
*/

var ID = argument[0];//may not need this

if (v_textbox_visible) && (!v_textbox_recalculate) && (global.static_visible) {
	if (v_textbox_width != 0 || v_textbox_height != 0) {
		//box
		draw_set_alpha(1);
		draw_set_color(v_textbox_bordercolor);
		draw_rectangle(t_x, t_y, t_x + v_textbox_width, t_y + v_textbox_height + y_pad, false);	
		draw_set_color(v_textbox_bodycolor);
		draw_rectangle(t_x + v_textbox_border_width, t_y + v_textbox_border_width,
		t_x + v_textbox_width - v_textbox_border_width, t_y + v_textbox_height - v_textbox_border_width + y_pad, false);
	}
		
	//text
	if (v_textbox_width == v_textbox_width_max) && (v_textbox_height == v_textbox_height_max) {
		var start_x = t_x + v_textbox_border_width + v_textbox_xpad;
		var start_y = t_y + v_textbox_border_width;
		if (v_textbox_typed) {
			//not finished
		} else {
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
				
			var curs_x = start_x;
			var curs_y = start_y;
				
			var biggest_segment_height = 0;
				
			// draw the lines
			for (var tbox_d_i = 0; tbox_d_i < ds_list_size(v_textbox_lines); tbox_d_i++) {
				var line = ds_list_find_value(v_textbox_lines, tbox_d_i);
				curs_x = start_x;
				curs_y += biggest_segment_height;
				for (var tbox_d_i2 = 0; tbox_d_i2 < ds_list_size(line); tbox_d_i2++) {
					var t_segment = ds_list_find_value(line, tbox_d_i2);
					if (t_segment.v_segment_height > biggest_segment_height) biggest_segment_height = t_segment.v_segment_height;
					for (var tbox_d_i3 = 0; tbox_d_i3 < ds_list_size(t_segment.v_segment_txts); tbox_d_i3++) {
						var t_txt = ds_list_find_value(t_segment.v_segment_txts, tbox_d_i3);
						draw_set_alpha(1);
						draw_set_font(t_txt.v_txt_font);
						draw_set_color(t_txt.v_txt_color);
						draw_text(curs_x + t_txt.v_txt_x_ofst, curs_y + t_txt.v_txt_y_ofst, t_txt.v_txt_text);
						curs_x += t_txt.v_txt_width;
					}
				}
			}
		}
	}
}