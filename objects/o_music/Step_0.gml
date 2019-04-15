/// @description Insert description here
// You can write your code in this editor

var newtrack = v_music_currenttrack;

if (global.prevroom != room) {
	if (room == main_menu) newtrack = snd_menumusic;
	if (room == Intro2) newtrack = snd_wizardtale;
	if (room == asset_get_index("BallTest")) newtrack = snd_music_level1;
	if (room == asset_get_index("room0")) newtrack = snd_music_level1;
	if (room == asset_get_index("room_elv")) newtrack = snd_music_level1;
	if (room == asset_get_index("room1")) newtrack = snd_music_level1;
	if (room == room_zombie) newtrack = snd_music_level1;
	
}

if (newtrack != v_music_currenttrack) {
	if (v_music_currenttrack != undefined) audio_stop_sound(v_music_currenttrack);
	v_music_currenttrack = newtrack;
	if (v_music_currenttrack != undefined) {
		var gain = audio_sound_get_gain(v_music_currenttrack) * global.music_volume;
		v_music_currentID = audio_play_sound(v_music_currenttrack, 1, true)
		audio_sound_gain(v_music_currentID, gain, 0);;
	}
}
	