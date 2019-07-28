if (place_meeting(x, y, o_player)) {
	ds_list_add(global.scenes_triggered, id);
	o_player.y = y;
	if (o_player.x < x) {
		o_player.x = x - v_scene_dialogue_xoffset;
		o_player.sprite_index = s_plr_gnd_idle_sword;
	} else {
		o_player.x = x + v_scene_dialogue_xoffset;
		o_player.sprite_index = s_plr_gnd_idle_sword_left;
	}
	return true;
} else return false;