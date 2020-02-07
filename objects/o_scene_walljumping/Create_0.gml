event_inherited();


sprite_index = s_testcharacter;
v_scene_trigger_scr = scr_scene_talk_trig;
//if (ds_list_find_index(global.scenes_triggered, id) >= 0) v_scene_trigger_scr = scr_scene_talk_trig;
v_scene_run_scr = scr_scene_walljumping_run;

/*
I can't think of a better place to note this, but global.scenes_triggered gets
cleared from the main menu when you start a new game.
*/