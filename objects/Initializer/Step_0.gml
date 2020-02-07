/// @description Fade To First Room

if (v_initializer_done) {
	v_initializer_done = false;
	global.spawn_transitionscript = scr_transition_elevator;
	global.spawn_obj = inst_444DDD9C; // this is a unique code from the room editor
	global.spawn_room = room_zombie; // this is the room the spawn_obj is in.
	//scr_transition_spawn();
	//room_goto(main_menu);
	scr_transition_fade(main_menu);
}
