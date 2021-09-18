/// @description scr_music_play(music)
/// @param music
function scr_music_play() {

	if (audio_exists(argument[0])) {
		if (o_music.v_music_currentID != undefined) audio_stop_sound(o_music.v_music_currentID);
		o_music.v_music_currenttrack = argument[0];
		var gain = audio_sound_get_gain(o_music.v_music_currenttrack) * global.music_volume;
		o_music.v_music_currentID = audio_play_sound(o_music.v_music_currenttrack, 1, true)
		audio_sound_gain(o_music.v_music_currentID, gain, 0);
	}


}
