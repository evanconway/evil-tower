/// @description scr_resumesfx()
function scr_resumesfx() {

	if (audio_is_paused(snd_elevator_mv)) audio_resume_sound(snd_elevator_mv);
	if (audio_is_paused(snd_emy_explosion)) audio_resume_sound(snd_emy_explosion);


}
