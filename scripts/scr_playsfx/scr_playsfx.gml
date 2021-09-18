/// @description scr_playsfx(sound, looped)
/// @param sound
/// @param looped
function scr_playsfx() {

	var sound = argument[0];
	var soundID = undefined;

	if (sound != undefined) {
		if (audio_is_playing(sound)) audio_stop_sound(sound);
		var gain = global.sfx_volume * audio_sound_get_gain(sound);
		if (argument_count > 1) soundID = audio_play_sound(sound, 1, argument[1]);
		else soundID = audio_play_sound(sound, 1, false);
		audio_sound_gain(soundID, gain, 0);
	}

	return soundID;



}
