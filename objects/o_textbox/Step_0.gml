/// @description Textbox logic

//if text has changed, we need to update the word and line lists
//as well as the max width and height values if necessary
if (v_textbox_recalculate) {
	v_textbox_recalculate = false
	v_textbox_height_max = 0;
	ds_list_clear(v_textbox_lines);
	var line = ds_list_create();//list of segment objects
	var line_width = 0;
	var line_height = 0;
	
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
					v_textbox_height_max += line_height;
					line = ds_list_create();//do not call clear! this erases the value just added to v_textbox_lines
					ds_list_add(line, t_o_segment);
					line_width = t_o_segment.v_segment_width;
					line_height = t_o_segment.v_segment_height;
				}
				
				// if this is the last segment, increase textbox height and add the current line
				if (seg_i == ds_list_size(segments) - 1) {
					v_textbox_height_max += line_height;
					ds_list_add(v_textbox_lines, line);
				}
			}
		}
	}
	line = ds_list_create();
	ds_list_destroy(line);
}

/*
This may never be used, but this allows a collision with the player to trigger 
a textbox to popup
*/

if (v_textbox_collideswithplayer && place_meeting(x, y, o_player) && !v_textbox_active) {
	v_textbox_triggered = true;
}

if (v_textbox_collideswithplayer && !place_meeting(x, y, o_player) && v_textbox_active) {
	v_textbox_close = true;	
}

/*
There are two variables to handle a textbox being activated. The first is triggered,
the second is activated. We set triggered to true to activate a textbox. For popups,
the most common kind of textbox we'll have, this means we start the expansion of the
textbox. Either way, we need to have something that determines a textbox to
interpret triggered to activate gets set to true, but only once. This is that code.
*/

if (!v_textbox_active && v_textbox_triggered) {
	v_textbox_active = true;
	v_textbox_triggered = false;
	
	// unique code for popup
	if (v_textbox_ispopup) {
		scr_playsfx(snd_txt_open);
		v_textbox_width = v_textbox_width_min;
		v_textbox_height = v_textbox_height_min;
	}
}

if (v_textbox_active && v_textbox_close && !v_textbox_ispermenant) {
	v_textbox_active = false;
	v_textbox_close = false;
	
	// unique code for popup
	if (v_textbox_ispopup) {
		scr_playsfx(snd_txt_close);
	}
}

//this code is only relevant if the textbox is a popup.
//determines whether or not it is time for the box to expand
if (v_textbox_ispopup) {
	if (v_textbox_active) {
		if (v_textbox_width < v_textbox_width_max) v_textbox_width += v_textbox_expandrate;
		if (v_textbox_width > v_textbox_width_max) v_textbox_width = v_textbox_width_max;
		if (v_textbox_height < v_textbox_height_max) v_textbox_height += v_textbox_expandrate;
		if (v_textbox_height > v_textbox_height_max) v_textbox_height = v_textbox_height_max;
	} else {
		if (v_textbox_width > v_textbox_width_min) v_textbox_width -= v_textbox_expandrate;
		if (v_textbox_width <= v_textbox_width_min) v_textbox_width = v_textbox_width_min;
		if (v_textbox_height > v_textbox_height_min) v_textbox_height -= v_textbox_expandrate;
		if (v_textbox_height <= v_textbox_height_min) v_textbox_height = v_textbox_height_min;
		
		if (v_textbox_width == v_textbox_width_min && v_textbox_height == v_textbox_height_min) {
			v_textbox_width = 0;
			v_textbox_height = 0;
		}
	}
} else {
	v_textbox_width = v_textbox_width_max;
	v_textbox_height = v_textbox_height_max;
}

//if box is at full size, prepare text
if (v_textbox_typed)
{
	
}