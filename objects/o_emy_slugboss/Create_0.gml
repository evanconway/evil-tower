event_inherited();
if (!instance_exists(id)) exit;

v_act_ai = instance_create_layer(x, y, "Enemies", o_ai_slugboss);
v_act_ai.v_ai_actor = id;

v_act_jump = -7;
v_act_vel_x_max = 1;

// states
v_act_state_hurt.v_state_hurt_health = 6;
v_act_state_hurt.v_state_sprite = s_slug_giant;
v_act_state_hurt.v_state_sprite_left = s_slug_giant_left;

v_emy_slugboss_state_gnd_idle = instance_create_layer(x, y, "Enemies", o_state_gnd_idle);
v_emy_slugboss_state_gnd_idle.v_state_sprite = s_slug_giant;
v_emy_slugboss_state_gnd_idle.v_state_sprite_left = s_slug_giant_left;

v_act_state_default = v_emy_slugboss_state_gnd_idle;

v_emy_slugboss_state_gnd_run = instance_create_layer(x, y, "Enemies", o_state_gnd_run);
v_emy_slugboss_state_gnd_run.v_state_sprite = s_slug_giant;
v_emy_slugboss_state_gnd_run.v_state_sprite_left = s_slug_giant_left;
v_emy_slugboss_state_gnd_run.v_state_gnd_run_maxx = 2;

v_emy_slugboss_state_jump = instance_create_layer(x, y, "Enemies", o_state_air_jump);
v_emy_slugboss_state_slam = instance_create_layer(x, y, "Enemies", o_state_slam);

v_emy_slugboss_state_attack = instance_create_layer(x, y, "Enemies", o_state_attack);
v_emy_slugboss_state_attack.v_state_sprite = s_slug_giant_attack;
v_emy_slugboss_state_attack.v_state_sprite_left = s_slug_giant_attack_left;
v_emy_slugboss_state_attack.v_state_attack_hitbox = o_hitbox_slugboss_barf;
v_emy_slugboss_state_attack.v_state_attack_offset_x = 35;
v_emy_slugboss_state_attack.v_state_attack_offset_y = -12;
v_emy_slugboss_state_attack.v_state_attack_startup = 0;
v_emy_slugboss_state_attack.v_state_attack_recovery = 20;

// remember hurt must connect to almost all states
scr_state_addconnect(v_act_state_hurt, v_emy_slugboss_state_gnd_idle);
scr_state_addconnect(v_act_state_hurt, v_emy_slugboss_state_gnd_run);
scr_state_addconnect(v_act_state_hurt, v_emy_slugboss_state_jump);
scr_state_addconnect(v_act_state_hurt, v_emy_slugboss_state_slam);
scr_state_addconnect(v_act_state_hurt, v_emy_slugboss_state_attack);

scr_state_addconnect(v_emy_slugboss_state_gnd_idle, v_emy_slugboss_state_gnd_run);
scr_state_addconnect(v_emy_slugboss_state_gnd_idle, v_emy_slugboss_state_jump);
scr_state_addconnect(v_emy_slugboss_state_gnd_idle, v_emy_slugboss_state_attack);

scr_state_addconnect(v_emy_slugboss_state_gnd_run, v_emy_slugboss_state_gnd_idle);
scr_state_addconnect(v_emy_slugboss_state_gnd_run, v_emy_slugboss_state_jump);
scr_state_addconnect(v_emy_slugboss_state_gnd_run, v_emy_slugboss_state_attack);

scr_state_addconnect(v_emy_slugboss_state_attack, v_emy_slugboss_state_gnd_idle);
scr_state_addconnect(v_emy_slugboss_state_attack, v_emy_slugboss_state_gnd_run);

scr_state_addconnect(v_emy_slugboss_state_jump, v_emy_slugboss_state_slam);
scr_state_addconnect(v_emy_slugboss_state_jump, v_emy_slugboss_state_gnd_idle);
scr_state_addconnect(v_emy_slugboss_state_jump, v_emy_slugboss_state_gnd_run);

scr_state_addconnect(v_emy_slugboss_state_slam, v_emy_slugboss_state_gnd_idle);
scr_state_addconnect(v_emy_slugboss_state_slam, v_emy_slugboss_state_gnd_run);
