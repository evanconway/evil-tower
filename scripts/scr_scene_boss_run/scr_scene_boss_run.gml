/// @description scr_scene_boss_run(args)

/// @param args

var ID = ds_list_find_value(argument[0], 0);

o_player.v_act_disableActcon = true;

switch (ID.v_scene_state) {
	case 0: // wait for player to touch ground
	var playeronground = false;
	with (o_player) if (place_meeting(x, y + 1, o_wall)) playeronground = true;
	if (playeronground) {
		o_player.v_act_faceright = true;
		ID.v_scene_state++;
		ID.v_scene_counter = 30;
		scr_music_fadeout(2000);
	}
	break;
	case 1: // wait one second
	ID.v_scene_counter--;
	if (ID.v_scene_counter <= 0) {
		ID.v_scene_state++;
		ID.v_scene_boss_cameraX = 728;
	}
	break;
	case 2:
	o_camera.v_camera_follow = undefined;
	o_camera.x += 1;
	if (o_camera.x >= ID.v_scene_boss_cameraX) {
		ID.v_scene_state++;
		ID.v_scene_counter = 180;
	}
	break;
	case 3:
	ID.v_scene_counter--;
	if (v_scene_counter <= 120 && v_scene_boss_wall == undefined) {
		v_scene_boss_wall = instance_create_layer(536, 861, "Walls", o_wall_1x1);
		v_scene_boss_wall.image_xscale = 24;
		v_scene_boss_wall.image_yscale = 67;
		scr_playsfx(snd_knock);
		scr_camera_shake(5, 0);
	}
	if (ID.v_scene_counter <= 0) {
		ID.v_scene_state++;
		ID.v_scene_boss = instance_create_layer(o_camera.x, o_camera.y - 120, "Enemies", o_emy_slugboss);
		ID.v_scene_boss.v_act_disableActcon = true;
		ID.v_scene_boss.v_act_faceright = false;
		scr_playsfx(snd_bigfall);
	}
	break;
	case 4:
	// make slug fall here
	with (ID.v_scene_boss) {
		var fallVel = scr_obj_approachdist_y_at_x_against_obj(id, 1.3, x, o_wall);
		scr_act_move_y(ID.v_scene_boss, fallVel);
	}
	var bossLanded = false;
	with (ID.v_scene_boss) bossLanded = place_meeting(x, y + 1, o_wall);
	if (bossLanded) {
		ID.v_scene_state++;
		ID.v_scene_counter = 100;
		scr_camera_shake(0, 4);
		scr_playsfx(snd_bigland);
	}
	break;
	case 5:
	v_scene_counter--;
	if (v_scene_counter <= 0) {
		v_scene_counter = 70;
		v_scene_boss.sprite_index = s_slug_giant_attack_left;
		scr_playsfx(snd_roar);
		v_scene_state++;
	}
	break;
	case 6:
	v_scene_counter--;
	if (v_scene_counter < 35) v_scene_boss.sprite_index = s_slug_giant_left;
	if (v_scene_counter <= 0) {
		v_scene_boss_roars--;
		if (v_scene_boss_roars > 0) {
			v_scene_counter = 70;
			v_scene_boss.sprite_index = s_slug_giant_attack_left;
			scr_playsfx(snd_roar);
		} else {
			v_scene_counter = 60;
			scr_music_play(snd_music_retrohero);
			v_scene_state++;
		}
	}
	break;
	case 7:
	v_scene_counter--;
	if (v_scene_counter <= 0) {
		o_player.v_act_disableActcon = false;
		v_scene_boss.v_act_disableActcon = false;
		v_scene_running = false;
		//scr_music_play(snd_music_retrohero);
		//o_camera.v_camera_follow = o_player;
	}
	break;
}