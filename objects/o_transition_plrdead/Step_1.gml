/// @description 

global.freezeactors = true;


switch (v_transition_stage) {
	case 0:
	v_transition_count--;
	if (v_transition_count <= 0) {
		v_transition_stage++;
		global.player.sprite_index = global.player.v_act_state_hurt.v_state_hurt_dead_sprite;
		v_transition_count = 120;
	}
	break;
	case 1:
	v_transition_count--;
	if (v_transition_count <= 0 || scr_input_continue()) {
		scr_transition_spawn();
	}
	break;
}
