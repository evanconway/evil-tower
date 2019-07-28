/// @description scr_music_fadeout(time)

/// @param fadeoutTime

// fade out current music track

if (o_music.v_music_currentID != undefined) {
	if (argument_count == 0) audio_sound_gain(o_music.v_music_currentID, 0, 900);
	else audio_sound_gain(o_music.v_music_currentID, 0, argument[0]);
	o_music.v_music_currentID = undefined;
}
