/// @description scr_scene_testchar_run(args)

/// @param args

global.freezeactors = true;

image_xscale = 1;
if (o_player.x > x) image_xscale = -1;

switch (v_scene_state) {
	case 0:
	scr_scene_dialogue_start("Well... hello there!", s_portrait1, 0);
	// params(text, portrait, portrait_index)
	/*
	textbox.v_textbox_triggered = true;
	scr_list_addsegment_multi(segments, "Well... hello there!", true, ID.v_scene_chirp);
	scr_textbox_setsegments(textbox, segments);
	textbox.v_textbox_portrait = s_portrait1;
	textbox.v_textbox_portrait_index = 0;
	v_scene_state++;
	*/
	break;
	case 1:
	scr_scene_dialogue_next("It's nice to see a new face around here.", 1);
	/*
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
	*/
	break;
	case 2:
	scr_scene_dialogue_next("I don't have much to say besides this example text.", 0);
	/*
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
	*/
	break;
	case 3:
	scr_scene_dialogue_next("Enjoy your day!", 2);
	/*
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
	*/
	break;
	case 4:
	scr_scene_dialogue_end();
	/*
	if (scr_input_continue()) {
		if (textbox.v_textbox_typeto_finish) {
			textbox.v_textbox_close = true;
			ID.v_scene_state++;
		} else textbox.v_textbox_typeto_finish = true;
	}
	*/
	break;
	case 5:
	scr_scene_dialogue_close();
	break;
}