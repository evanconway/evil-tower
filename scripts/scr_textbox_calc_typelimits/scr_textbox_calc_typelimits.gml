/// @description scr_textbox_calc_typelimits(textboxID)

/// @param textboxID

var ID = argument[0];

// determine typing limits
if (ID.v_textbox_typeto_finish) {
	ID.v_textbox_typeto_line = ds_list_size(ID.v_textbox_lines) - 1;
	var max_line = ds_list_find_value(ID.v_textbox_lines, ID.v_textbox_typeto_line);
	ID.v_textbox_typeto_sgmt = ds_list_size(max_line) - 1;
	var max_segment = ds_list_find_value(max_line, ID.v_textbox_typeto_sgmt);
	ID.v_textbox_typeto_otxt = ds_list_size(max_segment.v_segment_txts) - 1;
	var max_txt = ds_list_find_value(max_segment.v_segment_txts, ID.v_textbox_typeto_otxt);
	ID.v_textbox_typeto_char = string_length(max_txt.v_txt_text);
} else if (ID.v_textbox_typetimer > 0) ID.v_textbox_typetimer--;
else {
	var line = ds_list_find_value(ID.v_textbox_lines, ID.v_textbox_typeto_line);
	var segment = ds_list_find_value(line, ID.v_textbox_typeto_sgmt);
	var txt = ds_list_find_value(segment.v_segment_txts, ID.v_textbox_typeto_otxt);
	// if current segment is supposed to be typed, increase typeto_char as normal
	// otherwise force next segment
	if (segment.v_segment_typed) ID.v_textbox_typeto_char++
	else {
		ID.v_textbox_typeto_char = string_length(txt.v_txt_text) + 1;
		ID.v_textbox_typeto_otxt = ds_list_size(segment.v_segment_txts);
	}
	if (ID.v_textbox_typeto_char <= string_length(txt.v_txt_text)) {
		// typeto_char index still in current o_txt object
		// assign new typetimer based on the char
		scr_playsfx(txt.v_txt_chirp);
		if (scr_char_ispunc(string_char_at(txt.v_txt_text, ID.v_textbox_typeto_char))) ID.v_textbox_typetimer = ID.v_textbox_punc_delay;
		else ID.v_textbox_typetimer = ID.v_textbox_char_delay;
	} else {
		// typeto_char index outside current o_txt
		// reset char index, move otxt index, and check that it is in bounds
		ID.v_textbox_typeto_char = 1;//remember strings are 1 based  >:(
		ID.v_textbox_typeto_otxt++;
		if (ID.v_textbox_typeto_otxt < ds_list_size(segment.v_segment_txts)) {
			// typeto_otxt index is in bounds
			// assign new typetimer based on the char
			txt = ds_list_find_value(segment.v_segment_txts, ID.v_textbox_typeto_otxt);
			scr_playsfx(txt.v_txt_chirp);
			if (scr_char_ispunc(string_char_at(txt.v_txt_text, ID.v_textbox_typeto_char))) ID.v_textbox_typetimer = ID.v_textbox_punc_delay;
			else ID.v_textbox_typetimer = ID.v_textbox_char_delay;
		} else {
			// typeto_otxt index out of bounds of segment txt list
			// reset otxt index, move segment index, and line indexes, until we find a segment/line with v_segment_typing set true
			ID.v_textbox_typeto_otxt = 0;
			ID.v_textbox_typeto_sgmt++;
			var valid_sgmt_fnd = false;
			// don't start at 0, start with current line
			for (var line_i = ID.v_textbox_typeto_line; line_i < ds_list_size(ID.v_textbox_lines); line_i++) {
				line = ds_list_find_value(ID.v_textbox_lines, line_i);
				for (var sgmt_i = ID.v_textbox_typeto_sgmt; sgmt_i < ds_list_size(line); sgmt_i++) {
					segment = ds_list_find_value(line, sgmt_i);
					if (segment.v_segment_typed) {
						txt = ds_list_find_value(segment.v_segment_txts, ID.v_textbox_typeto_otxt);
						if (segment.v_segment_blankline) {
							ID.v_textbox_typetimer = ID.v_textbox_blank_delay;
						} else {
							scr_playsfx(txt.v_txt_chirp);
							if (scr_char_ispunc(string_char_at(txt.v_txt_text, ID.v_textbox_typeto_char))) ID.v_textbox_typetimer = ID.v_textbox_punc_delay;
							else ID.v_textbox_typetimer = ID.v_textbox_char_delay;
						}
						valid_sgmt_fnd = true;
						ID.v_textbox_typeto_line = line_i;
						ID.v_textbox_typeto_sgmt = sgmt_i;
						// break loop
						line_i = ds_list_size(ID.v_textbox_lines);
						sgmt_i = ds_list_size(line);
					}
				}
				/*
				The first time through the loop, we want to start with the next segment in the line.
				But once we're past that, the above loop should always start at 0. Don't reset if
				valid segment has been found (since this variable now holds important value).
				*/
				if (!valid_sgmt_fnd) ID.v_textbox_typeto_sgmt = 0;
			}
			// set limits to the end if we find no more typing segments.
			if (!valid_sgmt_fnd) {
				ID.v_textbox_typeto_finish = true;
				ID.v_textbox_typeto_line = ds_list_size(ID.v_textbox_lines) - 1;
				line = ds_list_find_value(ID.v_textbox_lines, ID.v_textbox_typeto_line);
				ID.v_textbox_typeto_sgmt = ds_list_size(line) - 1;
				segment = ds_list_find_value(line, ID.v_textbox_typeto_sgmt);
				ID.v_textbox_typeto_otxt = ds_list_size(segment.v_segment_txts) - 1;
				txt = ds_list_find_value(segment.v_segment_txts, ID.v_textbox_typeto_otxt);
				ID.v_textbox_typeto_char = string_length(txt.v_txt_text);
			}
		}
	}
}