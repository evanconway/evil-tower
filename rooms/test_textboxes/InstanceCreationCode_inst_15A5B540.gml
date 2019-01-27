v_textbox_bodycolor = c_black;
v_textbox_bordercolor = c_white;
v_textbox_width_max = 173;
v_textbox_ispopup = true;
v_textbox_y_offset = -60;
v_textbox_recalculate = true;
v_textbox_collideswithplayer = true;

var test_text = "Call me Ishmael. Some years ago--never mind how long precisely " +
"--having little or no money in my purse, and nothing particular to interest me " + 
"on shore, I thought I would sail about a little and see the watery part of the world.";

var t_chunk = ds_list_create();
scr_list_addsegment_multi(t_chunk, test_text, c_white);
ds_list_add(v_textbox_chunks, t_chunk);
t_chunk = ds_list_create();
ds_list_destroy(t_chunk);