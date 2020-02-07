/// @description Next Room

if (global.debug_keys_active) && (room != room_last) {
	if (instance_exists(o_transition)) instance_destroy(o_transition);
	global.freezeactors = false
	o_camera.v_camera_follow = global.player;
	audio_stop_all();
	if (o_music.v_music_currenttrack != undefined) {
		var gain = audio_sound_get_gain(o_music.v_music_currenttrack) * global.music_volume;
		o_music.v_music_currentID = audio_play_sound(o_music.v_music_currenttrack, 1, true)
		audio_sound_gain(o_music.v_music_currentID, gain, 0);;
	}
	room_goto_next();
}
