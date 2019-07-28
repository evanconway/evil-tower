if (instance_exists(o_player)) {
	o_player.v_act_state_hurt.v_state_hurt_health = o_player.v_act_state_hurt.v_state_hurt_health_max;
	scr_playsfx(snd_healthgot);
}