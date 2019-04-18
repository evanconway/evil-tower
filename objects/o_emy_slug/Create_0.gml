event_inherited();
if (!instance_exists(id)) exit;

v_act_ai = instance_create_layer(x, y, "Enemies", o_ai_wander_andattack);
v_act_ai.v_ai_actor = id;

// states
v_act_state_hurt.v_state_sprite = s_emy_slug_gnd_attack;
v_act_state_hurt.v_state_sprite_left = s_emy_slug_gnd_attack_left;

v_emy_slug_state_gnd_idle = instance_create_layer(x, y, "Enemies", o_state_gnd_idle);
v_emy_slug_state_gnd_idle.v_state_sprite = s_emy_slug_gnd_idle;
v_emy_slug_state_gnd_idle.v_state_sprite_left = s_emy_slug_gnd_idle_left;

v_act_state_default = v_emy_slug_state_gnd_idle;

v_emy_slug_state_gnd_run = instance_create_layer(x, y, "Enemies", o_state_gnd_run);
v_emy_slug_state_gnd_run.v_state_sprite = s_emy_slug_gnd_idle;
v_emy_slug_state_gnd_run.v_state_sprite_left = s_emy_slug_gnd_idle_left;
v_emy_slug_state_gnd_run.v_state_gnd_run_maxx = 0.4;

v_emy_slug_state_attack = instance_create_layer(x, y, "Enemies", o_state_attack);
v_emy_slug_state_attack.v_state_sprite = s_emy_slug_gnd_attack;
v_emy_slug_state_attack.v_state_sprite_left = s_emy_slug_gnd_attack_left;
v_emy_slug_state_attack.v_state_attack_hitbox = o_hitbox_slug_barf;
v_emy_slug_state_attack.v_state_attack_offset_x = 3;
v_emy_slug_state_attack.v_state_attack_offset_y = -3;
v_emy_slug_state_attack.v_state_attack_startup = 0;
v_emy_slug_state_attack.v_state_attack_recovery = 20;

// remember hurt must connect to almost all states
scr_state_addconnect(v_act_state_hurt, v_emy_slug_state_gnd_idle);
scr_state_addconnect(v_act_state_hurt, v_emy_slug_state_gnd_run);

scr_state_addconnect(v_emy_slug_state_gnd_idle, v_emy_slug_state_gnd_run);
scr_state_addconnect(v_emy_slug_state_gnd_idle, v_emy_slug_state_attack);

scr_state_addconnect(v_emy_slug_state_gnd_run, v_emy_slug_state_gnd_idle);
scr_state_addconnect(v_emy_slug_state_gnd_run, v_emy_slug_state_attack);

scr_state_addconnect(v_emy_slug_state_attack, v_emy_slug_state_gnd_idle);
scr_state_addconnect(v_emy_slug_state_attack, v_emy_slug_state_gnd_run);
