event_inherited();

audio_stop_all();
scr_playsfx(global.player.v_act_state_hurt.v_state_hurt_dead_snd);
global.player.sprite_index = global.player.v_act_state_hurt.v_state_sprite;
global.player.image_speed = 0;

v_transition_count = 120;
