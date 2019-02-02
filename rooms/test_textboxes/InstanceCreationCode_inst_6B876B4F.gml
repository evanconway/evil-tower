
v_textbox_recalculate = true;
v_textbox_width_max = 173;
v_textbox_ispopup = true;
v_textbox_y_offset = -60;
v_textbox_bodycolor = c_black;
v_textbox_bordercolor = c_white;
v_textbox_collideswithplayer = true;

var color = c_white;
var txt_index = 0;
var txt = ["Call me ",
			"Ishmael", //PERIOD red index = 1
			"Some years ago--never mind how long precisely --having little or no ",
			"money ",//yellow index = 3
			"in my purse, and nothing particular to ",
			"interest ",//green index = 5
			"me on shore, I thought I would sail about a little and see the ",
			"watery ",//blue index = 7
			"part of the world."]

scr_list_addsegment_multi(v_textbox_segments, txt[txt_index++], true);
scr_list_addsegment_punc(v_textbox_segments, txt[txt_index++], true, undefined, undefined, c_red, ".", undefined, color, false, false, enum_txt_fx_phys.hover);
scr_list_addsegment_multi(v_textbox_segments, txt[txt_index++]);
scr_list_addsegment(v_textbox_segments, txt[txt_index++], false, undefined, undefined, c_yellow, false, false, enum_txt_fx_phys.none, enum_txt_fx_colr.pulse);
scr_list_addsegment_multi(v_textbox_segments, txt[txt_index++]);
scr_list_addsegment(v_textbox_segments, txt[txt_index++], true, undefined, undefined, c_green);
scr_list_addsegment_multi(v_textbox_segments, txt[txt_index++], true);
scr_list_addsegment(v_textbox_segments, txt[txt_index++], false, undefined, undefined, c_blue);
scr_list_addsegment_multi(v_textbox_segments, txt[txt_index++]);
scr_list_addsegment_blankline(v_textbox_segments);
scr_list_addsegment_multi(v_textbox_segments, "New Line Test", true, undefined, undefined, undefined, true);
scr_list_addsegment_blankline(v_textbox_segments);
scr_list_addsegment_multi(v_textbox_segments, "another new line?", false, undefined, undefined, undefined, true);
