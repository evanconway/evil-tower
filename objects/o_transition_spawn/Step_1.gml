event_inherited();
if (v_transition_pause) exit;

global.freezeactors = true;
global.freezescenes = true;

v_transition_count--;
if (v_transition_count <= 0) {
	v_transition_count = v_transition_rate;
	switch (v_transition_stage) {
		case 0:
		v_transition_alpha += v_transition_change;
		if (v_transition_alpha >= 1) {
			v_transition_alpha = 1;
			v_transition_stage++;
			v_transition_color = v_transition_color2;
			room_goto(v_transition_targetroom);
		}
		break;
		case 1:
		o_camera.v_camera_follow = o_player;
		scr_act_setpos(o_player, global.spawn_obj.x, global.spawn_obj.y);
		v_transition_alpha -= v_transition_change;
		if (v_transition_alpha <= 0) {
			v_transition_alpha = 0;
			global.freezeactors = false;
			global.freezescenes = false;
			scr_music_playroom();
			instance_destroy(id);
		}
		break;
	}
}
