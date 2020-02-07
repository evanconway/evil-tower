/// @description Insert description here
// You can write your code in this editor
if (!global.freezeactors) {
	if (!intro_done) {
		var paragraph = introtext[pagenum, paragraphnum];//paragraph is an array of strings
		lineheight = font_get_size(f_menu);
	}
	switch(intro_state) {
		#region printing
		case enum_intro_state.printing:
		if (scr_intro_checkcontinue()) {
			switch (pagenum) {// a shameful solution I know, but quick and easy 
				case 0:
				ds_list_clear(stringstodraw);
				ds_list_set(stringstodraw, 0, page0string0);
				ds_list_set(stringstodraw, 1, page0string1);
				ds_list_set(stringstodraw, 2, page0string2);
				ds_list_set(stringstodraw, 3, page0string3);
				ds_list_set(stringstodraw, 4, page0string4);
				ds_list_set(stringstodraw, 5, page0string5);
				ds_list_set(stringstodraw, 6, page0string6);
				ds_list_set(stringstodraw, 7, page0string7);
				break;
				case 1:
				ds_list_clear(stringstodraw);
				ds_list_set(stringstodraw, 0, page1string0);
				ds_list_set(stringstodraw, 1, page1string1);
				ds_list_set(stringstodraw, 2, page1string2);
				ds_list_set(stringstodraw, 3, page1string3);
				ds_list_set(stringstodraw, 4, page1string4);
				ds_list_set(stringstodraw, 5, page1string5);
				ds_list_set(stringstodraw, 6, page1string6);
				break;
				case 2:
				ds_list_clear(stringstodraw);
				ds_list_set(stringstodraw, 0, page2string0);
				ds_list_set(stringstodraw, 1, page2string1);
				ds_list_set(stringstodraw, 2, page2string2);
				ds_list_set(stringstodraw, 3, page2string3);
				ds_list_set(stringstodraw, 4, page2string4);
				ds_list_set(stringstodraw, 5, page2string5);
				break;
			}
			charnum = 1;//string_char_at is not 0 based!!!
			linenum = 0;
			paragraphnum = 0;
			drawingline = 0;
			pagenum++;
			printdelay = 0;
			fade_percent = 0;
			intro_pagefinished = true;//I don't think this is necessary
			intro_showbutton = true;
			v_intro_blinkalpha = 0;
			intro_state = enum_intro_state.waiting;
			var numofpages = array_length_1d(introtext)//this returns max index, not actual number of items
			if (pagenum > numofpages) intro_done = true;
		} else if (printdelay > 0) printdelay--;
		else {
			if (intro_pagefinished) {
				intro_state = enum_intro_state.waiting;
				v_intro_blinkalpha = 0;
				intro_showbutton = true;
				pagenum++;
				var numofpages = array_length_1d(introtext)//this returns max index, not actual number of items
				if (pagenum > numofpages) intro_done = true;
			} else {
				var currentstring = ds_list_find_value(stringstodraw, drawingline);
				var newchar = string_char_at(paragraph[linenum], charnum);
				if (newchar == ".") || (newchar == ",") printdelay = printchardelay_sent;
				else printdelay = printchardelay_max;
				if (is_undefined(currentstring)) ds_list_set(stringstodraw, drawingline, newchar);
				else {
					var newstring = currentstring + newchar;
					ds_list_set(stringstodraw, drawingline, newstring);
				}
				charnum++;
				if (charnum > string_length(paragraph[linenum])) {
					charnum = 1;//string_char_at is not 0 based!!!
					linenum++;
					drawingline++;
					if (linenum >= array_length_1d(paragraph)) {
						linenum = 0;
						paragraphnum++;
						drawingline++;
						ds_list_add(stringstodraw, " ");
						printdelay = printparadelay_max;
						var numofparas = array_length_2d(introtext, pagenum);
						if (paragraphnum >= numofparas) {
							intro_pagefinished = true;
							paragraphnum = 0;
							drawingline = 0;
							printdelay = printpagedelay_max;
						}
					}
				}
			}
		}
		break;
		#endregion
		#region waiting
		case enum_intro_state.waiting:
		if (scr_intro_checkcontinue()) {
			intro_pagefinished = false;
			intro_showbutton = false;
			fade_percent = 0;
			intro_state = enum_intro_state.fading;
			if (intro_done) audio_stop_sound(o_music.v_music_currenttrack);//dramatic effect
		}
		break;
		#endregion
		#region fading
		case enum_intro_state.fading:
		if (fade_percent < fade_max) fade_percent += fade_rate;
		else {
			ds_list_clear(stringstodraw);
			intro_state = enum_intro_state.printing;
			if (intro_done) scr_transition_fade(global.firstroom);
		}	
		break;
		#endregion
	}
}