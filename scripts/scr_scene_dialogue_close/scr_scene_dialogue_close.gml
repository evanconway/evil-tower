/// @description scr_scene_dialogue_close()

if (v_scene_textbox.v_textbox_state == enum_textbox_state.off) {
	v_scene_running = false;
	v_scene_triggered = false;// so we can talk to him again!
	v_scene_state = 0;
	global.freezeactors = false;
	return true;
} else return false;
