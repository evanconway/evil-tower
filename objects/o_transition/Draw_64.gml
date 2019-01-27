/// @description Insert description here

if (global.transition_state != enum_transition_state.off) {
	v_transition_width = display_get_gui_width();
	v_transition_height = display_get_gui_height();
	v_transition_width_half = v_transition_width * 0.5;
	v_transition_height_half = v_transition_height * 0.5;
	draw_set_color(c_black);
	switch (v_transition_type) {
		case enum_transition_type.blink:
			draw_rectangle(0, 0, v_transition_width, v_transition_percent * v_transition_height_half, false);
			draw_rectangle(0, v_transition_height, v_transition_width, v_transition_height - v_transition_percent * v_transition_height_half, false);
			break;
		case enum_transition_type.fade:
			draw_set_alpha(v_transition_percent);
			draw_rectangle(0, 0, v_transition_width, v_transition_height, false);
			draw_set_alpha(1);
			break;
		case enum_transition_type.stepfade:
			draw_set_alpha(floor(v_transition_percent * v_transition_fadesteps)/v_transition_fadesteps);
			draw_rectangle(0, 0, v_transition_width, v_transition_height, false);
			break;	
	}
}
 