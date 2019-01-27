/// @description Insert description here

v_transition_width = display_get_gui_width();
v_transition_height = display_get_gui_height();

v_transition_width_half = v_transition_width * 0.5;
v_transition_height_half = v_transition_height * 0.5;

v_transition_target = room;

v_transition_percent = 0;
v_transition_blinkamount = 1.1;
v_transition_faderate = 0.02;
v_transition_fadesteps = 13;

enum enum_transition_state {
	off,
	next,
	goto,
	restart,
	intro
}

global.transition_state = enum_transition_state.off;

enum enum_transition_type {
	jump,
	blink,
	fade,
	stepfade
}

v_transition_type = enum_transition_type.stepfade;
