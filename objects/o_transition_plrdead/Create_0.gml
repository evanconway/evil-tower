event_inherited();

audio_stop_all();
scr_playsfx(global.player.v_act_state_hurt.v_state_hurt_dead_snd);
global.player.sprite_index = global.player.v_act_state_hurt.v_state_sprite;
global.player.image_speed = 0;

/*
var fx_list = ds_list_create();
for (var i = 0; i < instance_number(o_fx); i++) {
	ds_list_add(fx_list) = instance_find(obj_Enemy,i);
}
*/
while (instance_exists(o_fx)) instance_destroy(o_fx);
while (instance_exists(o_hitbox)) instance_destroy(o_hitbox);

v_transition_count = 120;

global.freezeactors = true;
