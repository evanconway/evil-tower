/// @description scr_scene_testchar_run(args)
function scr_scene_greeting_run() {

	/// @param args

	global.freezeactors = true;

	image_xscale = 1;
	if (o_player.x > x) image_xscale = -1;

	switch (v_scene_state) {
		case 0:
		v_scene_trigger_scr = scr_scene_talk_trig;
		scr_scene_dialogue_start("Hello!", s_portrait1, 0);
		break;
		case 1:
		scr_scene_dialogue_next("Thanks for coming to slay the monsters!", 1);
		break;
		case 2:
		scr_scene_dialogue_next("I'll be waiting for you at different parts of the tower.", 5);
		break;
		case 3:
		scr_scene_dialogue_next("Just press UP while next to me to talk to me.", 1);
		break;
		case 4:
		scr_scene_dialogue_next("I'll give you tips, and restore your health!", 0);
		break;
		case 5:
		if (scr_scene_dialogue_next("Good luck!", 1)) scr_plr_restorehealth();
		break;
		case 6:
		scr_scene_dialogue_end();
		break;
		case 7:
		if (scr_scene_dialogue_close(true)) {
			v_scene_state = 8;
			scr_music_playroom();
		}
		break;
		case 8:
		scr_scene_dialogue_start("Oh wow you're talking to me again already!", s_portrait1, 1);
		break;
		case 9:
		scr_scene_dialogue_next("You're so nice.", 5);
		break;
		case 10:
		scr_scene_dialogue_next("(or maybe you just need your health restored already)", 6);
		break;
		case 11:
		if (scr_scene_dialogue_next("Here's a tip: Press UP or DOWN near ladders to climb them.", 0)) scr_plr_restorehealth();
		break;
		case 12:
		scr_scene_dialogue_next("What, were you hoping for something more? Like a full tutorial?", 6);
		break;
		case 13:
		scr_scene_dialogue_next("Listen, around here a full tutorial is what we call...", 3);
		break;
		case 14:
		scr_scene_dialogue_next("o  u  t    o  f    s  c  o  p  e", 5);
		break;
		case 15:
		scr_scene_dialogue_next("Good luck!", 1);
		break;
		case 16:
		scr_scene_dialogue_end();
		break;
		case 17:
		if (scr_scene_dialogue_close(true)) v_scene_state = 18;

		break;
		case 18:
		scr_scene_dialogue_start("Health Restored!", s_portrait1, 1);
		break;
		case 19:
		if (scr_scene_dialogue_end()) scr_plr_restorehealth();
		break;
		case 20:
		if (scr_scene_dialogue_close(true)) v_scene_state = 18;
		break;
	}


}
