event_inherited();
if (v_transition_pause) exit;

global.freezeactors = true;
global.freezescenes = true;

v_transition_count--;
if (v_transition_count <= 0) {
	v_transition_count = v_transition_rate;
	switch (v_transition_stage) {
		case 0:
		global.player.sprite_index = v_transition_sprite1;
		scr_act_setpos(global.player, v_transition_door1.x, v_transition_door1.y);
		v_transition_alpha += v_transition_change;
		if (v_transition_alpha >= 1) {
			v_transition_alpha = 1;
			v_transition_stage++;
			v_transition_color = v_transition_color2;
			v_transition_door_plrhealth = o_player.v_act_state_hurt.v_state_hurt_health;
			room_goto(v_transition_targetroom);
		}
		break;
		case 1:
		global.player.sprite_index = v_transition_sprite2;
		scr_act_setpos(global.player, v_transition_door2.x, v_transition_door2.y);
		o_player.v_act_state_hurt.v_state_hurt_health = v_transition_door_plrhealth;
		v_transition_alpha -= v_transition_change;
		if (v_transition_alpha <= 0) {
			v_transition_alpha = 0;
			global.freezeactors = false;
			global.freezescenes = false;
			instance_destroy(id);
		}
		break;
	}
}
