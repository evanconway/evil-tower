/// @description scr_scene_boss_run(args)

/// @param args

var ID = ds_list_find_value(argument[0], 0);
var panSpeed = 1;
var bossSpawnXoffset = 60;

switch (ID.v_scene_state) {
	case 0: // wait for player to touch ground
	o_player.v_act_disableActcon = true;
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
		v_scene_boss_joke = instance_create_layer(v_scene_boss_cameraX + bossSpawnXoffset, o_player.y, "Enemies", o_emy_slug);
		v_scene_boss_joke.v_act_disableActcon = true;
		v_scene_boss_joke.v_act_faceright = false;
		v_scene_boss_joke.depth += 10;
	}
	break;
	case 2:
	o_camera.v_camera_follow = undefined;
	o_camera.x += panSpeed;
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
		// gamic numbers here adjust for room
		ID.v_scene_boss = instance_create_layer(o_camera.x + bossSpawnXoffset, o_camera.y - 120, "Enemies", o_emy_slugboss);
		ID.v_scene_boss.v_act_disableActcon = true;
		ID.v_scene_boss.v_act_faceright = false;
		scr_playsfx(snd_bigfall);
	}
	break;
	case 4:
	// make slug fall here
	with (ID.v_scene_boss) {
		ID.v_scene_boss.sprite_index = s_slug_giant_falling_left;
		var fallVel = scr_obj_approachdist_y_at_x_against_obj(id, 1.3, x, o_wall);
		scr_act_move_y(ID.v_scene_boss, fallVel);
	}
	var bossLanded = false;
	with (ID.v_scene_boss) bossLanded = place_meeting(x, y + 1, o_wall);
	if (bossLanded) {
		
		instance_create_layer(v_scene_boss_joke.x, v_scene_boss_joke.y, "Hitboxes", o_fx_slug_barf_hit);
		instance_destroy(v_scene_boss_joke);
		with (instance_create_layer(0, 0, "Text", o_bosshealth)) v_bosshealth_boss = ID.v_scene_boss;
		ID.v_scene_boss.sprite_index = s_slug_giant_left;
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
		v_scene_state++;
		// THIE FIGHT HAS BEGUN
		scr_plr_restorehealth();// eh... why not.
	}
	break;
	case 8:
	if (v_scene_boss.v_act_state_hurt.v_state_hurt_health <= 0) {
		instance_destroy(v_scene_boss.v_act_hitbox); //slug can't hurt player anymore.
		v_scene_boss.v_act_hitbox = undefined;
		o_player.v_act_disableActcon = true;
		audio_stop_sound(o_music.v_music_currentID);
		v_scene_counter = v_scene_boss_splatcounter;
		v_scene_state++;
	}
	break;
	// trying to create death animation
	case 9:
	v_scene_counter--
	if (v_scene_counter <= 0) {
		v_scene_counter = floor(0.99 * v_scene_boss_splatcounter);
		v_scene_boss_splatcounter = v_scene_counter;
		var splatX = irandom_range(v_scene_boss.bbox_left, v_scene_boss.bbox_right);
		var splatY = irandom_range(v_scene_boss.bbox_top, v_scene_boss.bbox_bottom);
		instance_create_layer(splatX, splatY, "Projectiles", o_fx_slug_barf_hit);
		scr_playsfx(snd_barf_hit);
		if (v_scene_boss_splatcounter <= 1) {
			instance_destroy(v_scene_boss.v_act_state_hurt.v_state_hurt_dead_scene);
			instance_destroy(v_scene_boss);
			scr_camera_shake(10,0);
			scr_playsfx(snd_bigland);
			v_scene_counter = 120;
			v_scene_state++;
		}
	}
	break;
	case 10:
	v_scene_counter--;
	if (v_scene_counter <= 0) {
		instance_destroy(inst_604390C0);
		scr_camera_shake(3, 0);
		scr_playsfx(snd_knock);
		v_scene_counter = 60;
		v_scene_state++;
	}
	break;
	case 11:
	v_scene_counter--;
	if (v_scene_counter <= 0) v_scene_state++;
	break;
	case 12:
	if (o_camera.x < o_player.x) {
		o_camera.x += panSpeed;
		if (o_camera.x > o_player.x) o_camera.x = o_player.x;
	}
	if (o_camera.x > o_player.x) {
		o_camera.x -= panSpeed;
		if (o_camera.x < o_player.x) o_camera.x = o_player.x;
	}
	if (o_camera.x == o_player.x) {
		o_camera.v_camera_follow = o_player;
		o_player.v_act_disableActcon = false;
		v_scene_running = false;
	}
	break;
}