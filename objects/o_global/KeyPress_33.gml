/// @description Next Room

if (global.debug_keys_active) && (room != room_last) {
	if (instance_exists(o_transition)) instance_destroy(o_transition);
	room_goto_next();
}
