/// @description scr_music_fadeout()

// fade out current music track

if (o_music.v_music_currentID != undefined) {
	audio_sound_gain(o_music.v_music_currentID, 0, 900);
}
