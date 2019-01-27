/// @description Change Full Screen
if (global.debug_keys_active) {
	if window_get_fullscreen() window_set_fullscreen(false);
	else window_set_fullscreen(true);
}