/// @description scr_textbox_calclines(textboxID)

/// @param textboxID

/*
This script fills the v_textbox_lines list with segments that fit the
boundaries of the textbox. It will also automatically adjust boundaries
if the current box boundaries cannot accomidate the text. 
*/

var ID = argument[0];

ds_list_clear(ID.v_textbox_lines);
var line = ds_list_create();//list of segment objects
var line_width = 0;
if (ID.v_textbox_hasportrait) line_width += ID.v_textbox_portrait_buffer;
var line_height = 0;
// text normally draws onto border, ypad ensures enough space.
var text_height = v_textbox_ypad;
	
// now iterate through segments
for (var seg_i = 0; seg_i < ds_list_size(v_textbox_segments); seg_i++) {
		
	/* 
	Remember textbox_width_max includes the border, so we have to calculate
	the actual amount of space allowed inside the texbox and store it in a var.
	*/
	var max_segment_width = ID.v_textbox_width_max - 2 * ID.v_textbox_border_width;
	var t_o_segment = ds_list_find_value(ID.v_textbox_segments, seg_i);
		
	/*
	This if statement checks to see if the o_segment is wider than max_segment_width.
	Since max_segment_width is derived from textbox_max_width, and segments are 
	basically words, we are checking to see if the segment is wider than the 
	textbox_width_max. As a design choice, I've decided to expand the max width 
	of the box instead of forcing the word to break and line wrap. 
	*/
	if (scr_get_width_segment_nospace(t_o_segment) >= max_segment_width) {
		// segment is too big, adjust width_max
		ID.v_textbox_width_max = scr_get_width_segment_nospace(t_o_segment) + 2 * ID.v_textbox_border_width + 1;
		ID.v_textbox_recalculate = true; // recalculate everything again
				
		// set both index to max value to break loop
		seg_i = ds_list_size(ID.v_textbox_segments);
	} else {
				
		// we need to check if the segment marks a new line
		if (t_o_segment.v_segment_startnewline) {
			
			// it does, if the current line is not empty, add it to the textbox lines list
			if (!ds_list_empty(line)) {
				ds_list_add(ID.v_textbox_lines, line);
				text_height += line_height;
				if (ID.v_textbox_height_max < text_height) ID.v_textbox_height_max = text_height;
				line = ds_list_create(); // make new line
			}

			// and add segment to new line
			ds_list_add(line, t_o_segment);
			line_width = t_o_segment.v_segment_width;
			if (ID.v_textbox_hasportrait) line_width += ID.v_textbox_portrait_buffer;
			line_height = t_o_segment.v_segment_height;
		} else {
				
			// it is not a new line, normal calculations
			// segment is normal sized, check to see if it fits on current line
			if ((line_width + scr_get_width_segment_nospace(t_o_segment)) < max_segment_width) {
					
				// it does, add it to the line and increase line width (and height if necessary)
				ds_list_add(line, t_o_segment);
				line_width += t_o_segment.v_segment_width;
				if (t_o_segment.v_segment_height > line_height) line_height = t_o_segment.v_segment_height;
			} else {
					
				// it doesn't, add current line to lines list and start new line and add current segment
				ds_list_add(ID.v_textbox_lines, line);
				text_height += line_height;
				if (ID.v_textbox_height_max < text_height) ID.v_textbox_height_max = text_height;
				line = ds_list_create();//do not call clear! this erases the value just added to v_textbox_lines
				ds_list_add(line, t_o_segment);
				line_width = t_o_segment.v_segment_width;
				if (ID.v_textbox_hasportrait) line_width += ID.v_textbox_portrait_buffer;
				line_height = t_o_segment.v_segment_height;
			}
		}
				
		// if this is the last segment, increase textbox height (if needed) and add the current line
		if (seg_i == ds_list_size(ID.v_textbox_segments) - 1) {
			text_height += line_height;
			if (ID.v_textbox_height_max < text_height) ID.v_textbox_height_max = text_height;
			ds_list_add(ID.v_textbox_lines, line);
		}
	}
}

//not adding "create" destroys the last addition to v_textbox_lines
line = ds_list_create();
ds_list_destroy(line);