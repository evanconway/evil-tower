/// @description scr_scene_boss_win_run()
function scr_scene_boss_win_run() {

	o_player.x = x - v_scene_dialogue_xoffset;
	o_player.y = y;
	o_player.sprite_index = s_plr_gnd_idle_sword;
	global.freezeactors = true;

	switch (v_scene_state) {
		case 0:
		scr_scene_dialogue_start("!!!", s_portrait1, 4);
		break;
		case 1:
		scr_scene_dialogue_next("Wow!", 1);
		break;
		case 2:
		scr_scene_dialogue_next("That was great!", 0);
		break;
		case 3:
		scr_scene_dialogue_next("That boss was harder than I remember...", 2);
		break;
		case 4:
		scr_scene_dialogue_next("But you beat him anyway!", 1);
		break;
		case 5:
		scr_scene_dialogue_next("Great job! And hey....", 0);
		break;
		case 6:
		scr_scene_dialogue_next("Thanks for playing my game.", 0);
		break;
		case 7:
		scr_scene_dialogue_next("This was so much more work than I thought it was going to be.", 2);
		break;
		case 8:
		scr_scene_dialogue_next("And you played through the whole thing!", 1);
		break;
		case 9:
		scr_scene_dialogue_next("Thank you.", 0);
		break;
		case 10:
		scr_scene_dialogue_next("Making this was a great learning experience. But now...", 0);
		break;
		case 11:
		scr_scene_dialogue_next("It's time to move on to something new.", 1);
		break;
		case 12:
		scr_scene_dialogue_next("Good bye!", 2);
		break;
		case 13:
		scr_scene_dialogue_end();
		break;
		case 14:
		if (scr_scene_dialogue_close(false)) scr_transition_fade(main_menu);
		break;
	}


}
