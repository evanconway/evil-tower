/// @description scr_scene_testchar_run(args)
function scr_scene_block_run() {

	/// @param args

	global.freezeactors = true;

	image_xscale = 1;
	if (o_player.x > x) image_xscale = -1;

	switch (v_scene_state) {
		case 0:
		v_scene_trigger_scr = scr_scene_talk_trig;
		scr_scene_dialogue_start("You can't kill fire with your sword.", s_portrait1, 0);
		break;
		case 1:
		scr_scene_dialogue_next("So you'll have to jump over these guys.", 1);
		break;
		case 2:
		scr_scene_dialogue_next("But just so ya know, you can DEFEND against it!", 3);
		break;
		case 3:
		scr_scene_dialogue_next("...", 5);
		break;
		case 4:
		scr_scene_dialogue_next("You're gonna have to check the controls menu.", 6);
		break;
		case 5:
		scr_scene_dialogue_next("I didn't program... er...", 2);
		break;
		case 6:
		scr_scene_dialogue_next("I don't know how to 'say' the DEFEND button.", 2);
		break;
		case 7:
		if (scr_scene_dialogue_next("Go get 'em!", 3)) scr_plr_restorehealth();
		break;
		case 8:
		scr_scene_dialogue_end();
		break;
		case 9:
		if (scr_scene_dialogue_close(true)) v_scene_state = 10;
		break;
		case 10:
		scr_scene_dialogue_start("Health Restored!", s_portrait1, 1);
		break;
		case 11:
		if (scr_scene_dialogue_end()) scr_plr_restorehealth();
		break;
		case 12:
		if (scr_scene_dialogue_close(true)) v_scene_state = 10;
		break;
	}


}
