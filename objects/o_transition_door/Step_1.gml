/// @description 

global.freezeactors = true;

v_transition_count--;
if (v_transition_count <= 0) {
	v_transition_count = v_transition_rate;
	switch (v_transition_stage) {
		case 0:
		o_player.sprite_index = v_transition_sprite1;
		scr_act_setpos(o_player, v_transition_door1.x, v_transition_door1.y);
		v_transition_alpha += v_transition_change;
		if (v_transition_alpha >= 1) {
			v_transition_alpha = 1;
			v_transition_stage++;
			v_transition_color = v_transition_color2;
			room_goto(v_transition_targetroom);
		}
		break;
		case 1:
		o_player.sprite_index = v_transition_sprite2;
		scr_act_setpos(o_player, v_transition_door2.x, v_transition_door2.y);
		v_transition_alpha -= v_transition_change;
		if (v_transition_alpha <= 0) {
			v_transition_alpha = 0;
			global.freezeactors = false;
			instance_destroy(id);
		}
		break;
	}
}
