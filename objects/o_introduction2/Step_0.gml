/// @description Insert description here

switch (v_intro_state) {
	case 0:
	scr_textbox_setsegments(v_intro_textbox, ds_list_find_value(v_intro_segmentlists, 0));
	v_intro_state++;
	break;
	case 1:
	if (scr_input_continue()) {
		if (v_intro_textbox.v_textbox_typeto_finish) {
			scr_textbox_setsegments(v_intro_textbox, ds_list_find_value(v_intro_segmentlists, 1));
		} else v_intro_textbox.v_textbox_typeto_finish = true;
	}
	break;
	case 2:
	if (scr_input_continue()) {
		if (v_intro_textbox.v_textbox_typeto_finish) {
			scr_textbox_setsegments(v_intro_textbox, ds_list_find_value(v_intro_segmentlists, 2));
		} else v_intro_textbox.v_textbox_typeto_finish = true;
	}
	break;
	case 3:
	if (scr_input_continue() && global.transition_state == enum_transition_state.off) {
		if (v_intro_textbox.v_textbox_typeto_finish) {
			scr_transition(enum_transition_state.goto, global.firstroom);
		} else v_intro_textbox.v_textbox_typeto_finish = true;
	}
	break;
}
