/// @description scr_scene_testchar_run(args)
function scr_scene_crouchattack_run() {

	/// @param args

	global.freezeactors = true;

	image_xscale = 1;
	if (o_player.x > x) image_xscale = -1;

	switch (v_scene_state) {
		case 0:
		v_scene_trigger_scr = scr_scene_talk_trig;
		scr_scene_dialogue_start("If you hold DOWN you'll crouch.", s_portrait1, 0);
		break;
		case 1:
		scr_scene_dialogue_next("And if you ATTACK while you're crouching, you'll do...", 5);
		break;
		case 2:
		scr_scene_dialogue_next("A crouch attack!.", 1);
		break;
		case 3:
		scr_scene_dialogue_next("Big surprise right?", 0);
		break;
		case 4:
		scr_scene_dialogue_next("You'll need it to kill those slugs.", 6);
		break;
		case 5:
		scr_scene_dialogue_next("They're too low for your regular attack.", 6);
		break;
		case 6:
		scr_scene_dialogue_next("Keep at it!", 1);
		break;
		case 7:
		if (scr_scene_dialogue_end()) scr_plr_restorehealth();
		break;
		case 8:
		if (scr_scene_dialogue_close(true)) v_scene_state = 9;
		break;
		case 9:
		scr_scene_dialogue_start("(is this a dress or a robe?)", s_portrait1, 5);
		break;
		case 10:
		scr_scene_dialogue_next("(and these are my hands right?...)", 5);
		break;
		case 11:
		scr_scene_dialogue_next("OH!", 4);
		break;
		case 12:
		scr_scene_dialogue_next("Sorry, don't mind me.", 0);
		break;
		case 13:
		scr_scene_dialogue_next("Health Restored!", 1);
		break;
		case 14:
		if (scr_scene_dialogue_end()) scr_plr_restorehealth();
		break;
		case 15:
		if (scr_scene_dialogue_close(true)) v_scene_state = 16;
		break;
		case 16:
		scr_scene_dialogue_start("Health Restored!", s_portrait1, 1);
		break;
		case 17:
		if (scr_scene_dialogue_end()) scr_plr_restorehealth();
		break;
		case 18:
		if (scr_scene_dialogue_close(true)) v_scene_state = 16;
		break;
	}


}
