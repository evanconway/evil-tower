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