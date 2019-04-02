/// @description 
if (room != global.currentroom) {
	global.prevroom = global.currentroom;
	global.currentroom = room;
	
	audio_stop_sound(snd_elevator_mv);
}

#region // doors (moving player between them)
if (room == global.door_newroom) {
	scr_plr_setstate(o_player, enum_plr_state.door);
}
#endregion

if (!instance_exists(o_elevator)) global.elevator_active = false;

if (global.pauseactive ||
	global.elevator_active ||
	global.transition_state != enum_transition_state.off) {
	global.freezeactors = true;
} else global.freezeactors = false;
