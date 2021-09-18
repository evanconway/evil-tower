/// @description scr_scene_testchar_run(args)
function scr_scene_walljumping_run() {

	/// @param args

	global.freezeactors = true;

	image_xscale = 1;
	if (o_player.x > x) image_xscale = -1;

	switch (v_scene_state) {
		case 0:
		v_scene_trigger_scr = scr_scene_talk_trig;
		scr_scene_dialogue_start("Ooh... this part looks tricky.", s_portrait1, 0);
		break;
		case 1:
		scr_scene_dialogue_next("There aren't any ladders to climb. But you...", 1);
		break;
		case 2:
		scr_scene_dialogue_next("You can wall jump!", 4);
		break;
		case 3:
		scr_scene_dialogue_next("When you're in the air, press into the wall to slide.", 2);
		break;
		case 4:
		scr_scene_dialogue_next("While you're sliding, press JUMP to wall jump!", 2);
		break;
		case 5:
		scr_scene_dialogue_next("That should get you up there no problem.", 6);
		break;
		case 6:
		scr_scene_dialogue_next("Good luck!", 5);
		break;
		case 7:
		if (scr_scene_dialogue_end()) scr_plr_restorehealth();
		break;
		case 8:
		if (scr_scene_dialogue_close(true)) v_scene_state = 9;
		break;
		case 9:
		scr_scene_dialogue_start("Health Restored!", s_portrait1, 1);
		break;
		case 10:
		if (scr_scene_dialogue_end()) scr_plr_restorehealth();
		break;
		case 11:
		if (scr_scene_dialogue_close(true)) v_scene_state = 9;
		break;
	}


}
