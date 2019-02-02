/// @description scr_playsfx(sound, looped)
/// @param sound
/// @param looped

if (argument[0] != undefined) {
	audio_sound_gain(argument[0], global.sfx_volume, 0);
	if (audio_is_playing(argument[0])) audio_stop_sound(argument[0]);
	if (argument_count > 1) audio_play_sound(argument[0], 1, argument[1]);
	else audio_play_sound(argument[0], 1, false);
}
