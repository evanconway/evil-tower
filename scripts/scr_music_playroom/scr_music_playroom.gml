/// @description scr_music_playroom()

// plays the currenttrack value stored in o_music

if (o_music.v_music_currenttrack != undefined) {
	if (o_music.v_music_currentID != undefined && instance_exists(o_music.v_music_currentID)) audio_stop_sound(o_music.v_music_currentID);
	var gain = audio_sound_get_gain(o_music.v_music_currenttrack) * global.music_volume;
	o_music.v_music_currentID = audio_play_sound(o_music.v_music_currenttrack, 1, true)
	audio_sound_gain(o_music.v_music_currentID, gain, 0);
}
