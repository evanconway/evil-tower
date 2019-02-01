/// @description scr_scene_testchar_run(args)

/// @param args

var ID = ds_list_find_value(argument[0], 0);
var textbox = ID.v_scene_textbox;
var segments = ds_list_create();

switch (ID.v_scene_state) {
	case 0:
	textbox.v_textbox_triggered = true;
	scr_list_addsegment_multi(segments, 
	"Well... hello there!", 
	ID.v_scene_textcolor, true);
	scr_textbox_setsegments(textbox, segments);
	v_scene_state++;
	break;
	case 1:
	if (scr_input_ui_check(enum_input.select)) {
		ds_list_clear(segments);
		scr_list_addsegment_multi(segments,
		"It's nice to see a new face around here.",
		ID.v_scene_textcolor, true);
		scr_textbox_setsegments(textbox, segments);
		ID.v_scene_state++;
	}
	break;
	case 2:
	if (scr_input_ui_check(enum_input.select)) {
		ds_list_clear(segments);
		scr_list_addsegment_multi(segments,
		"I don't have much to say besides this example text.",
		ID.v_scene_textcolor, true);
		scr_textbox_setsegments(textbox, segments);
		ID.v_scene_state++;
	}
	break;
	case 3:
	if (scr_input_ui_check(enum_input.select)) {
		ds_list_clear(segments);
		scr_list_addsegment_multi(segments,
		"Enjoy your day!",
		ID.v_scene_textcolor, true);
		scr_textbox_setsegments(textbox, segments);
		ID.v_scene_state++;
	}
	break;
	case 4:
	if (scr_input_ui_check(enum_input.select)) {
		textbox.v_textbox_close = true;
		ID.v_scene_state++;
	}
	break;
	case 5:
	if (textbox.v_textbox_state == enum_textbox_state.off) ID.v_scene_running = false;
	break;
}

segments = ds_list_create();
ds_list_destroy(segments);