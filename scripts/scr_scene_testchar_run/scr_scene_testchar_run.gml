/// @description scr_scene_testchar_run(args)

/// @param args

var ID = ds_list_find_value(argument[0], 0);
var textbox = ID.v_scene_textbox;
var segments = ds_list_create();

global.freezeactors = true;

switch (ID.v_scene_state) {
	case 0:
	textbox.v_textbox_triggered = true;
	scr_list_addsegment_multi(segments, 
	"Well... hello there!", 
	true, ID.v_scene_chirp);
	scr_textbox_setsegments(textbox, segments);
	textbox.v_textbox_portrait = s_portait1;
	textbox.v_textbox_portrait_index = 0;
	v_scene_state++;
	break;
	case 1:
	if (scr_input_continue()) {
		if (textbox.v_textbox_typeto_finish) {
			ds_list_clear(segments);
			scr_list_addsegment_multi(segments,
			"It's nice to see a new face around here.",
			true, ID.v_scene_chirp);
			scr_textbox_setsegments(textbox, segments);
			textbox.v_textbox_portrait_index = 1
			ID.v_scene_state++;
		} else textbox.v_textbox_typeto_finish = true;
	}
	break;
	case 2:
	if (scr_input_continue()) {
		if (textbox.v_textbox_typeto_finish) {
			ds_list_clear(segments);
			scr_list_addsegment_multi(segments,
			"I don't have much to say besides this example text.",
			true, ID.v_scene_chirp);
			scr_textbox_setsegments(textbox, segments);
			textbox.v_textbox_portrait_index = 0;
			ID.v_scene_state++;
		} else textbox.v_textbox_typeto_finish = true;
	}
	break;
	case 3:
	if (scr_input_continue()) {
		if (textbox.v_textbox_typeto_finish) {
			ds_list_clear(segments);
			scr_list_addsegment_multi(segments,
			"Enjoy your day!",
			true, ID.v_scene_chirp);
			scr_textbox_setsegments(textbox, segments);
			textbox.v_textbox_portrait_index = 2;
			ID.v_scene_state++;
		} else textbox.v_textbox_typeto_finish = true;
	}
	break;
	case 4:
	if (scr_input_continue()) {
		if (textbox.v_textbox_typeto_finish) {
			textbox.v_textbox_close = true;
			ID.v_scene_state++;
		} else textbox.v_textbox_typeto_finish = true;
	}
	break;
	case 5:
	if (textbox.v_textbox_state == enum_textbox_state.off) {
		ID.v_scene_running = false;
		ID.v_scene_triggered = false;// so we can talk to him again!
		ID.v_scene_state = 0;
		global.freezeactors = false;
	}
	break;
}

segments = ds_list_create();
ds_list_destroy(segments);