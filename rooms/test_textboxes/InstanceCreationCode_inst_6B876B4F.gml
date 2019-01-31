
v_textbox_recalculate = true;
v_textbox_width_max = 173;
v_textbox_ispopup = true;
v_textbox_y_offset = -60;
v_textbox_bodycolor = c_black;
v_textbox_bordercolor = c_white;
v_textbox_collideswithplayer = true;

var color_default = c_white;
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

scr_list_addsegment_multi(v_textbox_segments, txt[txt_index++], color_default);
scr_list_addsegment_period_fx(v_textbox_segments, txt[txt_index++], c_red, color_default, false, enum_txt_fx_phys.hover, enum_txt_fx_colr.none);
scr_list_addsegment_multi(v_textbox_segments, txt[txt_index++], color_default, true);
scr_list_addsegment_fx(v_textbox_segments, txt[txt_index++], c_yellow, false, enum_txt_fx_phys.none, enum_txt_fx_colr.pulse);
scr_list_addsegment_multi(v_textbox_segments, txt[txt_index++], color_default);
scr_list_addsegment(v_textbox_segments, txt[txt_index++], c_green);
scr_list_addsegment_multi(v_textbox_segments, txt[txt_index++], color_default, true);
scr_list_addsegment(v_textbox_segments, txt[txt_index++], c_blue);
scr_list_addsegment_multi(v_textbox_segments, txt[txt_index++], color_default);
scr_list_addsegment_blankline(v_textbox_segments);
scr_list_addsegment_multi(v_textbox_segments, "New Line Test", color_default, true, true);
scr_list_addsegment_blankline(v_textbox_segments);
scr_list_addsegment_multi(v_textbox_segments, "another new line?", color_default, false, true);
