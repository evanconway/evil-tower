/// @description Fade To First Room

if (v_initializer_done) {
	v_initializer_done = false;
	global.spawn_transitionscript = scr_transition_elevator;
	global.spawn_obj = inst_444DDD9C; // this is a unique code from the room editor
	global.spawn_room = room_zombie; // this is the room the above instance exists in
	//scr_transition_spawn();
	room_goto(test_boss);
}
