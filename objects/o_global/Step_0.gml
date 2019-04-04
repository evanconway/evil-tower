/// @description 
if (room != global.currentroom) {
	global.prevroom = global.currentroom;
	global.currentroom = room;
	
	audio_stop_sound(snd_elevator_mv);
}

if (global.pauseactive ||
	global.elevator_active ||
	global.transition_state != enum_transition_state.off) {
	global.freezeactors = true;
} else global.freezeactors = false;
