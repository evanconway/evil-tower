/// @description Textbox logic

//if text has changed, we need to update the word and line lists
//as well as the max width and height values if necessary
if (v_textbox_recalculate) {
	v_textbox_recalculate = false
	//v_textbox_height_max = 0;
	ds_list_clear(v_textbox_lines);
	var line = ds_list_create();//list of segment objects
	var line_width = 0;
	var line_height = 0;
	var text_height = 0;//the height of all lines combined
	
	// iterate through each list of segments in the chunk
	for (var chunk_i = 0; chunk_i < ds_list_size(v_textbox_chunks); chunk_i++) {
		var segments = ds_list_find_value(v_textbox_chunks, chunk_i);
		
		//now iterate through the segments in the list at chunk_i
		for (var seg_i = 0; seg_i < ds_list_size(segments); seg_i++) {
			
			/* 
			Remember textbox_width_max includes the border, so we have to calculate
			the actual amount of space allowed inside the texbox and store it in a var.
			*/
			var max_segment_width = v_textbox_width_max - 2 * v_textbox_border_width;
			var t_o_segment = ds_list_find_value(segments, seg_i);
			
			/*
			This if statement checks to see if the o_segment is wider than max_segment_width.
			Since max_segment_width is derived from textbox_max_width, and segments are 
			basically words, we are checking to see if the segment is wider than the 
			textbox_width_max. As a design choice, I've decided to expand the max width 
			of the box instead of forcing the word to break and line wrap. 
			*/
			if (scr_get_width_segment_nospace(t_o_segment) >= max_segment_width) {
				// segment is too big, adjust width_max
				v_textbox_width_max = scr_get_width_segment_nospace(t_o_segment) + 2 * v_textbox_border_width + 1;
				v_textbox_recalculate = true; // recalculate everything again
				
				// set both indexes to max value to break loops
				seg_i = ds_list_size(segments);
				chunk_i = ds_list_size(v_textbox_chunks);
			} else {
				
				// segment is normal sized, check to see if it fits on current line
				if ((line_width + scr_get_width_segment_nospace(t_o_segment)) < max_segment_width) {
					
					// it does, add it to the line and increase line width (and height if necessary)
					ds_list_add(line, t_o_segment);
					line_width += t_o_segment.v_segment_width;
					if (t_o_segment.v_segment_height > line_height) line_height = t_o_segment.v_segment_height;
				} else {
					
					// it doesn't, add current line to lines list and start new line and add current segment
					ds_list_add(v_textbox_lines, line);
					text_height += line_height;
					if (v_textbox_height_max < text_height) v_textbox_height_max = text_height;
					line = ds_list_create();//do not call clear! this erases the value just added to v_textbox_lines
					ds_list_add(line, t_o_segment);
					line_width = t_o_segment.v_segment_width;
					line_height = t_o_segment.v_segment_height;
				}
				
				// if this is the last segment, increase textbox height and add the current line
				if (seg_i == ds_list_size(segments) - 1) {
					text_height += line_height;
					if (v_textbox_height_max < text_height) v_textbox_height_max = text_height;
					ds_list_add(v_textbox_lines, line);
				}
			}
		}
	}
	line = ds_list_create();
	ds_list_destroy(line);
	
	//auto adjust expande rate
	if (v_textbox_width_max > v_textbox_height_max) v_textbox_expandrate = v_textbox_width_max/v_textbox_expanddiv;
	else v_textbox_expandrate = v_textbox_height_max/v_textbox_expanddiv;
}


switch (v_textbox_state) {
	case enum_textbox_state.off:
		//for triggering textbox if it can collide with player
		if (v_textbox_collideswithplayer && place_meeting(x, y, o_player)) {
			v_textbox_triggered = true;
		}
	
		//check for textbox trigger
		if (v_textbox_triggered) {
			v_textbox_triggered = false;//doesn't need to stay on
			v_textbox_state = enum_textbox_state.active;//this gets overriden if popup
			if (v_textbox_ispopup) {
				scr_playsfx(snd_txt_open);
				v_textbox_state = enum_textbox_state.opening;
				v_textbox_width = v_textbox_width_min;
				v_textbox_height = v_textbox_height_min;
			}
		}
	break;
	case enum_textbox_state.opening:
		if (v_textbox_width < v_textbox_width_max) v_textbox_width += v_textbox_expandrate;
		if (v_textbox_width > v_textbox_width_max) v_textbox_width = v_textbox_width_max;
		if (v_textbox_height < v_textbox_height_max) v_textbox_height += v_textbox_expandrate;
		if (v_textbox_height > v_textbox_height_max) v_textbox_height = v_textbox_height_max;
	
		if (v_textbox_height == v_textbox_height_max && v_textbox_width == v_textbox_width_max) {
			v_textbox_state = enum_textbox_state.active;
		}
	break;
	case enum_textbox_state.active:
		if (v_textbox_collideswithplayer && !place_meeting(x, y, o_player)) {
			v_textbox_close = true;
		}
	
		if (v_textbox_close && !v_textbox_ispermenant) {
			v_textbox_close = false;//turn of the close trigger
			v_textbox_state = enum_textbox_state.off;
			if (v_textbox_ispopup) {
				v_textbox_state = enum_textbox_state.closing;
				scr_playsfx(snd_txt_close);
			}
		}
	break;
	case enum_textbox_state.closing:
		if (v_textbox_width > v_textbox_width_min) v_textbox_width -= v_textbox_expandrate;
		if (v_textbox_width <= v_textbox_width_min) v_textbox_width = v_textbox_width_min;
		if (v_textbox_height > v_textbox_height_min) v_textbox_height -= v_textbox_expandrate;
		if (v_textbox_height <= v_textbox_height_min) v_textbox_height = v_textbox_height_min;
		
		if (v_textbox_width == v_textbox_width_min && v_textbox_height == v_textbox_height_min) {
			v_textbox_width = 0;
			v_textbox_height = 0;
			v_textbox_state = enum_textbox_state.off;
		}
	break;
	
}

//if box is at full size, prepare text
if (v_textbox_typed)
{
	
}