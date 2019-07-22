/// @description scr_music_play(music)
/// @param music

if (audio_exists(argument[0])) {
	o_music.v_music_currenttrack = argument[0];
	var gain = audio_sound_get_gain(o_music.v_music_currenttrack) * global.music_volume;
	o_music.v_music_currentID = audio_play_sound(o_music.v_music_currenttrack, 1, true)
	audio_sound_gain(o_music.v_music_currentID, gain, 0);
}