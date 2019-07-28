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
	o_player.v_act_state_cur = o_player.v_act_state_default;
	//remember we still have to call scr_act_setpos even though we've set 
	//the player position because we have a bunch of other variables that 
	//also affect player position which this script sets.
	scr_act_setpos(o_player, o_player.x, o_player.y);
	return true;
} else return false;