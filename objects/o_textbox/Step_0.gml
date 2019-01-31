/// @description Textbox logic

//if text has changed, we need to update the word and line lists
//as well as the max width and height values if necessary
if (v_textbox_recalculate) {
	v_textbox_recalculate = false

	scr_textbox_calclines(id);

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
		
		// determine typing limits
		if (v_textbox_typetimer > 0) v_textbox_typetimer--;
		else {
			var line = ds_list_find_value(v_textbox_lines, v_textbox_typeto_line);
			var segment = ds_list_find_value(line, v_textbox_typeto_sgmt);
			var txt = ds_list_find_value(segment.v_segment_txts, v_textbox_typeto_otxt);
			// if current segment is supposed to be typed, increase typeto_char as normal
			// otherwise force next segment
			if (segment.v_segment_typed) v_textbox_typeto_char++
			else {
				v_textbox_typeto_char = string_length(txt.v_txt_text) + 1;
				v_textbox_typeto_otxt = ds_list_size(segment.v_segment_txts);
			}
			if (v_textbox_typeto_char <= string_length(txt.v_txt_text)) {
				// typeto_char index still in current o_txt object
				// assign new typetimer based on the char
				if (scr_char_ispunc(string_char_at(txt.v_txt_text, v_textbox_typeto_char))) v_textbox_typetimer = v_textbox_punc_delay;
				else v_textbox_typetimer = v_textbox_char_delay;
			} else {
				// typeto_char index outside current o_txt
				// reset char index, move otxt index, and check that it is in bounds
				v_textbox_typeto_char = 1;//remember strings are 1 based  >:(
				v_textbox_typeto_otxt++;
				if (v_textbox_typeto_otxt < ds_list_size(segment.v_segment_txts)) {
					// typeto_otxt index is in bounds
					// assign new typetimer based on the char
					txt = ds_list_find_value(segment.v_segment_txts, v_textbox_typeto_otxt);
					if (scr_char_ispunc(string_char_at(txt.v_txt_text, v_textbox_typeto_char))) v_textbox_typetimer = v_textbox_punc_delay;
					else v_textbox_typetimer = v_textbox_char_delay;
				} else {
					// typeto_otxt index out of bounds of segment txt list
					// reset otxt index, move segment index, and line indexes, until we find a segment/line with v_segment_typing set true
					v_textbox_typeto_otxt = 0;
					v_textbox_typeto_sgmt++;
					var valid_sgmt_fnd = false;
					// don't start at 0, start with current line
					for (var line_i = v_textbox_typeto_line; line_i < ds_list_size(v_textbox_lines); line_i++) {
						line = ds_list_find_value(v_textbox_lines, line_i);
						for (var sgmt_i = v_textbox_typeto_sgmt; sgmt_i < ds_list_size(line); sgmt_i++) {
							segment = ds_list_find_value(line, sgmt_i);
							if (segment.v_segment_typed) {
								// assign new typetimer based on char in the newly found, valid segment
								txt = ds_list_find_value(segment.v_segment_txts, v_textbox_typeto_otxt);
								if (scr_char_ispunc(string_char_at(txt.v_txt_text, v_textbox_typeto_char))) v_textbox_typetimer = v_textbox_punc_delay;
								else v_textbox_typetimer = v_textbox_char_delay;
								valid_sgmt_fnd = true;
								v_textbox_typeto_line = line_i;
								v_textbox_typeto_sgmt = sgmt_i;
								// break loop
								line_i = ds_list_size(v_textbox_lines);
								sgmt_i = ds_list_size(line);
							}
						}
						/*
						The first time through the loop, we want to start with the next segment in the line.
						But once we're past that, the above loop should always start at 0. Don't reset if
						valid segment has been found (since this variable now holds important value).
						*/
						if (!valid_sgmt_fnd) v_textbox_typeto_sgmt = 0;
					}
					// set limits to the end if we find no more typing segments.
					if (!valid_sgmt_fnd) {
						v_textbox_typeto_line = ds_list_size(v_textbox_lines) - 1;
						line = ds_list_find_value(v_textbox_lines, v_textbox_typeto_line);
						v_textbox_typeto_sgmt = ds_list_size(line) - 1;
						segment = ds_list_find_value(line, v_textbox_typeto_sgmt);
						v_textbox_typeto_otxt = ds_list_size(segment.v_segment_txts) - 1;
						txt = ds_list_find_value(segment.v_segment_txts, v_textbox_typeto_otxt);
						v_textbox_typeto_char = string_length(txt.v_txt_text);
					}
				}
			}
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

/*
Depending on what segments have the typed variable set true, we will not display all text.
This is where we determine how much of the text we're displaying.
*/