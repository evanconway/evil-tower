/// @description scr_playsfx(sound, looped)
/// @param sound
/// @param looped

var sound = argument[0];

if (sound != undefined) {
	if (audio_is_playing(sound)) audio_stop_sound(sound);
	var gain = global.sfx_volume * audio_sound_get_gain(sound);
	if (argument_count > 1) audio_sound_gain(audio_play_sound(sound, 1, argument[1]), gain, 0);
	else audio_sound_gain(audio_play_sound(sound, 1, false), gain, 0);
}
