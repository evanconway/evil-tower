/// @description scr_pausesfx()
function scr_pausesfx() {

	if (audio_is_playing(snd_elevator_mv)) audio_pause_sound(snd_elevator_mv);
	if (audio_is_playing(snd_emy_explosion)) audio_pause_sound(snd_emy_explosion);


}
