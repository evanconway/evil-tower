event_inherited();
if (!instance_exists(id)) exit;

v_act_ai = instance_create_layer(x, y, "Enemies", o_ai_slugboss2);
v_act_ai.v_ai_actor = id;

v_act_jump = -10;
v_act_vel_x_max = 2.2;

// states
v_act_state_hurt.v_state_hurt_health_max = 15;
v_act_state_hurt.v_state_hurt_health = v_act_state_hurt.v_state_hurt_health_max;
v_act_state_hurt.v_state_sprite = s_slug_giant_rising;
v_act_state_hurt.v_state_sprite_left = s_slug_giant_rising_left;
v_act_state_hurt.v_state_hurt_dead_scene = o_transition_bossdead;

v_emy_slugboss_state_gnd_idle = instance_create_layer(x, y, "Enemies", o_state_gnd_idle);
v_emy_slugboss_state_gnd_idle.v_state_sprite = s_slug_giant;
v_emy_slugboss_state_gnd_idle.v_state_sprite_left = s_slug_giant_left;

v_act_state_default = v_emy_slugboss_state_gnd_idle;

v_emy_slugboss_state_gnd_run = instance_create_layer(x, y, "Enemies", o_state_gnd_run);
v_emy_slugboss_state_gnd_run.v_state_sprite = s_slug_giant;
v_emy_slugboss_state_gnd_run.v_state_sprite_left = s_slug_giant_left;
v_emy_slugboss_state_gnd_run.v_state_gnd_run_maxx = 2;

v_emy_slugboss_state_jump = instance_create_layer(x, y, "Enemies", o_state_air_jump);
v_emy_slugboss_state_jump.v_state_sprite = s_slug_giant_rising;
v_emy_slugboss_state_jump.v_state_sprite_left = s_slug_giant_rising_left;
v_emy_slugboss_state_jump.v_state_air_spritedn = s_slug_giant_falling;
v_emy_slugboss_state_jump.v_state_air_spritedn_left = s_slug_giant_falling_left;

v_emy_slugboss_state_slam = instance_create_layer(x, y, "Enemies", o_state_slam);
v_emy_slugboss_state_slam.v_state_slam_sprite_dn = s_slug_giant_falling;
v_emy_slugboss_state_slam.v_state_slam_sprite_dn_left = s_slug_giant_falling_left;
v_emy_slugboss_state_slam.v_state_slam_sprite_land = s_slug_giant;
v_emy_slugboss_state_slam.v_state_slam_sprite_land_left = s_slug_giant_left;

v_emy_slugboss_state_attack = instance_create_layer(x, y, "Enemies", o_state_attack);
v_emy_slugboss_state_attack.v_state_sprite = s_slug_giant_attack;
v_emy_slugboss_state_attack.v_state_sprite_left = s_slug_giant_attack_left;
v_emy_slugboss_state_attack.v_state_attack_hitbox = o_hitbox_slugboss_barf;
v_emy_slugboss_state_attack.v_state_attack_offset_x = 35;
v_emy_slugboss_state_attack.v_state_attack_offset_y = -12;
v_emy_slugboss_state_attack.v_state_attack_startup = 0;
v_emy_slugboss_state_attack.v_state_attack_recovery = 20;

v_emy_slugboss_state_ram = instance_create_layer(x, y, "Enemies", o_state_ram);
v_emy_slugboss_state_ram.v_state_sprite = s_slug_giant_attack;
v_emy_slugboss_state_ram.v_state_sprite_left = s_slug_giant_attack_left;
v_emy_slugboss_state_ram.v_state_ram_donesprite = s_slug_giant;
v_emy_slugboss_state_ram.v_state_ram_donesprite_left = s_slug_giant_left;
v_emy_slugboss_state_ram.v_state_ram_fx = o_fx_slug_barf_hit;
v_emy_slugboss_state_ram.v_state_ram_hitbox_Xogknockback = v_act_hitbox.v_hitbox_knock_x;
v_emy_slugboss_state_ram.v_state_ram_hitbox_Yogknockback = v_act_hitbox.v_hitbox_knock_y;

// remember hurt must connect to almost all states
scr_state_addconnect(v_act_state_hurt, v_emy_slugboss_state_gnd_idle);
scr_state_addconnect(v_act_state_hurt, v_emy_slugboss_state_gnd_run);
scr_state_addconnect(v_act_state_hurt, v_emy_slugboss_state_jump);
scr_state_addconnect(v_act_state_hurt, v_emy_slugboss_state_slam);
scr_state_addconnect(v_act_state_hurt, v_emy_slugboss_state_attack);
scr_state_addconnect(v_act_state_hurt, v_emy_slugboss_state_ram);

scr_state_addconnect(v_emy_slugboss_state_gnd_idle, v_emy_slugboss_state_ram);
scr_state_addconnect(v_emy_slugboss_state_gnd_idle, v_emy_slugboss_state_gnd_run);
scr_state_addconnect(v_emy_slugboss_state_gnd_idle, v_emy_slugboss_state_jump);
scr_state_addconnect(v_emy_slugboss_state_gnd_idle, v_emy_slugboss_state_attack);

scr_state_addconnect(v_emy_slugboss_state_gnd_run, v_emy_slugboss_state_ram);
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

scr_state_addconnect(v_emy_slugboss_state_ram, v_emy_slugboss_state_gnd_idle);
scr_state_addconnect(v_emy_slugboss_state_ram, v_emy_slugboss_state_gnd_run);

scr_state_addaltrun(v_act_state_hurt, v_emy_slugboss_state_ram);
scr_state_addaltrun(v_emy_slugboss_state_gnd_idle, v_emy_slugboss_state_ram);
scr_state_addaltrun(v_emy_slugboss_state_attack, v_emy_slugboss_state_ram);
scr_state_addaltrun(v_emy_slugboss_state_jump, v_emy_slugboss_state_ram);
