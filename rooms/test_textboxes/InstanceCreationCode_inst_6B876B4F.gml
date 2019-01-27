
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

var t_chunk = ds_list_create();

scr_list_addsegment_multi(t_chunk, txt[txt_index++], color_default);
scr_list_addsegment_period(t_chunk, txt[txt_index++], c_red, color_default);
scr_list_addsegment_multi(t_chunk, txt[txt_index++], color_default);
scr_list_addsegment(t_chunk, txt[txt_index++], c_yellow, color_default);
scr_list_addsegment_multi(t_chunk, txt[txt_index++], color_default);
scr_list_addsegment(t_chunk, txt[txt_index++], c_green, color_default);
scr_list_addsegment_multi(t_chunk, txt[txt_index++], color_default);
scr_list_addsegment(t_chunk, txt[txt_index++], c_blue, color_default);
scr_list_addsegment_multi(t_chunk, txt[txt_index++], color_default);

ds_list_add(v_textbox_chunks, t_chunk);
t_chunk = ds_list_create();
ds_list_destroy(t_chunk);