/// @description Insert description here

switch (v_intro_state) {
	case 0:
	if (global.transition_state == enum_transition_state.off) {
	scr_textbox_setsegments(v_intro_textbox, ds_list_find_value(v_intro_segmentlists, v_intro_segment_index++));
	v_intro_textbox.v_textbox_triggered = true;
	v_intro_state++;
	}
	break;
	case 1:
	if (v_intro_textbox.v_textbox_typeto_finish) {
		if (v_intro_continue.v_textbox_state == enum_textbox_state.off) {
			v_intro_continue.v_textbox_triggered = true;
		}
		if (scr_input_continue()) {
			v_intro_state = 2;
		}
	} else {
		if (scr_input_continue()) {
			v_intro_textbox.v_textbox_typeto_finish = true;
			v_intro_continue.v_textbox_triggered = true;
		}
	}
	break;
	case 2:
	if (v_intro_alpha < v_intro_alpha_max) {
		if (v_intro_alpha_timer > 0) v_intro_alpha_timer--;
		else {
			v_intro_alpha += v_intro_alpha_rate;
			v_intro_alpha_timer = v_intro_alpha_timer_max;
		}
	} else {
		if (v_intro_segment_index < ds_list_size(v_intro_segmentlists)) {
			v_intro_state = 1;
			scr_textbox_setsegments(v_intro_textbox, ds_list_find_value(v_intro_segmentlists, v_intro_segment_index++));
			v_intro_continue.v_textbox_close = true;
			v_intro_alpha = 0;
		} else {
			scr_transition(enum_transition_state.goto, global.firstroom);
		}
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
