/// @description Insert description here
// You can write your code in this editor

var newtrack = v_music_currenttrack;

if (global.prevroom != room) {
	if (room == asset_get_index("main_menu")) newtrack = snd_menumusic;
	if (room == asset_get_index("Intro")) newtrack = snd_wizardtale;
	if (room == asset_get_index("BallTest")) newtrack = snd_levelMusic;
	if (room == asset_get_index("room0")) newtrack = snd_levelMusic;
	if (room == asset_get_index("room_elv")) newtrack = snd_levelMusic;
	if (room == asset_get_index("room1")) newtrack = snd_levelMusic;
	if (room == asset_get_index("room_zombie")) newtrack = snd_music_retrohero;
}

if (newtrack != v_music_currenttrack) {
	if (v_music_currenttrack != undefined) audio_stop_sound(v_music_currenttrack);
	v_music_currenttrack = newtrack;
	audio_sound_gain(v_music_currenttrack, global.music_volume, 0);
	if (!instance_exists(o_player) && v_music_currenttrack != global.novalue) audio_play_sound(v_music_currenttrack, 1, true);
}

if (instance_exists(o_player)) && (v_music_currenttrack != global.novalue) {
	if (o_player.v_plr_state == enum_plr_state.dead) && (audio_is_playing(v_music_currenttrack)) audio_stop_sound(v_music_currenttrack);
	if (o_player.v_plr_state == enum_plr_state.gnd_idle) && (!audio_is_playing(v_music_currenttrack)) audio_play_sound(v_music_currenttrack, 1, true);
}
	