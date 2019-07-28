event_inherited();

v_act_ai = instance_create_layer(x, y, "Player", o_ai_user);
v_act_ai.v_ai_actor = id;

v_plr_data = false;

v_act_vel_x_max = 1.6;
v_act_vel_y_max = 4;
v_plr_grv = 0.15;
v_act_jump = -3.7;
v_plr_climbspd = v_act_vel_x_max * 0.7;

// states
v_act_state_hurt = instance_create_layer(x, y, "Player", o_state_hurt);
v_act_state_hurt.v_state_draw_behind = scr_state_hurt_draw_behind;
v_act_state_hurt.v_state_sprite = s_plr_hurt;
v_act_state_hurt.v_state_hurt_fx = o_fx_smack;
v_act_state_hurt.v_state_hurt_snd = snd_hurt2_notail;
v_act_state_hurt.v_state_hurt_health_max = global.player_health_max;
v_act_state_hurt.v_state_hurt_health = v_act_state_hurt.v_state_hurt_health_max;
v_act_state_hurt.v_state_hurt_dead_snd = snd_dead;
v_act_state_hurt.v_state_hurt_dead_scene = o_transition_plrdead;
v_act_state_hurt.v_state_hurt_dead_sprite = s_plr_dead;
v_act_state_hurt.v_state_count_max = 20;
v_act_state_hurt.v_state_hurt_vel_y_max = 3;
v_act_state_hurt.v_state_hurt_fx_yoffset = (bbox_bottom - bbox_top) / 2;
v_act_state_hurt.v_state_hurt_invultime = 120;

v_plr_state_gnd_idle = instance_create_layer(x, y, "Player", o_state_gnd_idle);
v_plr_state_gnd_idle.v_state_sprite = s_plr_gnd_idle_sword;
v_plr_state_gnd_idle.v_state_sprite_left = s_plr_gnd_idle_sword_left

v_act_state_default = v_plr_state_gnd_idle;

v_plr_state_gnd_run = instance_create_layer(x, y, "Player", o_state_gnd_run);
v_plr_state_gnd_run.v_state_sprite = s_plr_gnd_run_sword;
v_plr_state_gnd_run.v_state_sprite_left = s_plr_gnd_run_sword_left;
v_plr_state_gnd_run.v_state_gnd_run_maxx = v_act_vel_x_max;

v_plr_state_gnd_crouch = instance_create_layer(x, y, "Player", o_state_gnd_crouch);
v_plr_state_gnd_crouch.v_state_sprite = s_plr_gnd_crouch_sword;
v_plr_state_gnd_crouch.v_state_sprite_left = s_plr_gnd_crouch_sword_left;
#region attack_crouch to crouch
v_plr_state_attackctocrouch = instance_create_layer(x, y, "Player", o_state_gnd_crouch);
v_plr_state_attackctocrouch.v_state_sprite = s_plr_gnd_crouch_sword;
v_plr_state_attackctocrouch.v_state_sprite_left = s_plr_gnd_crouch_sword_left;
v_plr_state_attackctocrouch.v_state_script_connect = scr_state_attackctocrouch_connect;
#endregion

v_plr_state_air_jump = instance_create_layer(x, y, "Player", o_state_air_jump);
v_plr_state_air_jump.v_state_sprite = s_plr_air_up_sword;
v_plr_state_air_jump.v_state_sprite_left = s_plr_air_up_sword_left;
v_plr_state_air_jump.v_state_air_spritedn = s_plr_air_dn_sword;
v_plr_state_air_jump.v_state_air_spritedn_left = s_plr_air_dn_sword_left;
v_plr_state_air_jump.v_state_air_grv = v_plr_grv;

v_plr_state_air = instance_create_layer(x, y, "Player", o_state_air);
v_plr_state_air.v_state_sprite = s_plr_air_up_sword;
v_plr_state_air.v_state_sprite_left = s_plr_air_up_sword_left;
v_plr_state_air.v_state_air_spritedn = s_plr_air_dn_sword;
v_plr_state_air.v_state_air_spritedn_left = s_plr_air_dn_sword_left;
v_plr_state_air.v_state_air_grv = v_plr_grv;

v_plr_state_wall_stick = instance_create_layer(x, y, "Player", o_state_wall_stick);
v_plr_state_wall_stick.v_state_sprite = s_plr_walljump_sword;
v_plr_state_wall_stick.v_state_sprite_left = s_plr_walljump_left_sword;

v_plr_state_wall_jump = instance_create_layer(x, y, "Player", o_state_wall_jump);
v_plr_state_wall_jump.v_state_sprite = s_plr_air_up_sword;
v_plr_state_wall_jump.v_state_sprite_left = s_plr_air_up_sword_left;

v_plr_state_ladder_up = instance_create_layer(x, y, "Player", o_state_ladder_up);
v_plr_state_ladder_up.v_state_sprite = s_plr_ladder_climbing;
v_plr_state_ladder_up.v_state_ladder_climbspd = v_plr_climbspd;

v_plr_state_ladder_down = instance_create_layer(x, y, "Player", o_state_ladder_down);
v_plr_state_ladder_down.v_state_sprite = s_plr_ladder_climbing;
v_plr_state_ladder_down.v_state_ladder_climbspd = v_plr_climbspd;

v_plr_state_ladder_idle = instance_create_layer(x, y, "Player", o_state_ladder_idle);
v_plr_state_ladder_idle.v_state_sprite = s_plr_ladder_climbing;

v_plr_state_ladder_fall = instance_create_layer(x, y, "Player", o_state_ladder_fall);
v_plr_state_ladder_fall.v_state_sprite = s_plr_air_dn_sword;
v_plr_state_ladder_fall.v_state_sprite_left = s_plr_air_dn_sword_left;
v_plr_state_ladder_fall.v_state_ladder_fallspd_max = v_act_vel_y_max;


v_plr_state_attack = instance_create_layer(x, y, "Player", o_state_attack);
v_plr_state_attack.v_state_sprite = s_plr_gnd_attack_sword;
v_plr_state_attack.v_state_sprite_left = s_plr_gnd_attack_sword_left;
v_plr_state_attack.v_state_attack_startup = 13;
v_plr_state_attack.v_state_attack_recovery = 9;
v_plr_state_attack.v_state_attack_hitbox = o_hitbox_plr_sword;

v_plr_state_attack_crouch = instance_create_layer(x, y, "Player", o_state_attack);
v_plr_state_attack_crouch.v_state_sprite = s_plr_gnd_attack_crouch;
v_plr_state_attack_crouch.v_state_sprite_left = s_plr_gnd_attack_crouch_left;
v_plr_state_attack_crouch.v_state_attack_startup = v_plr_state_attack.v_state_attack_startup;
v_plr_state_attack_crouch.v_state_attack_recovery = v_plr_state_attack.v_state_attack_recovery;
v_plr_state_attack_crouch.v_state_attack_hitbox = o_hitbox_plr_sword_crouch;
v_plr_state_attack_crouch.v_state_attack_offset_x = 18;
v_plr_state_attack_crouch.v_state_attack_offset_y = -3;

v_plr_state_defend = instance_create_layer(x, y, "Player", o_state_defend);
v_plr_state_defend.v_state_sprite = s_plr_gnd_block;
v_plr_state_defend.v_state_sprite_left = s_plr_gnd_block_left;
v_plr_state_defend.v_state_defend_block = o_block_plr;
v_plr_state_defend.v_state_defend_offset_x = 5;

v_plr_state_slam = instance_create_layer(x, y, "Player", o_state_slam);
v_plr_state_slam.v_state_slam_sprite_dn = s_plr_air_dn_sword;
v_plr_state_slam.v_state_slam_sprite_dn_left = s_plr_air_dn_sword_left;
v_plr_state_slam.v_state_slam_sprite_land = s_plr_gnd_crouch_sword;
v_plr_state_slam.v_state_slam_sprite_land_left = s_plr_gnd_crouch_sword_left;

v_plr_state_ram = instance_create_layer(x, y, "Player", o_state_ram);
v_plr_state_ram.v_state_sprite = s_plr_gnd_run_sword;
v_plr_state_ram.v_state_sprite_left = s_plr_gnd_run_sword_left;

// state connections
// idle
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_ladder_up);
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_ladder_down); // we have to check for ladder down before crouch
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_gnd_crouch);
//scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_ram);
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_attack);
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_defend);
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_gnd_run);
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_air_jump);

// run
//scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_ram);
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_attack);
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_defend);
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_ladder_up);
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_ladder_down); // has to be before crouch
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_gnd_crouch);
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_air_jump);
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_air);

// jump
scr_state_addconnect(v_plr_state_air_jump, v_plr_state_attack);
scr_state_addconnect(v_plr_state_air_jump, v_plr_state_defend);
scr_state_addconnect(v_plr_state_air_jump, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_air_jump, v_plr_state_gnd_run);
scr_state_addconnect(v_plr_state_air_jump, v_plr_state_wall_stick);
//scr_state_addconnect(v_plr_state_air_jump, v_plr_state_slam);

// air
scr_state_addconnect(v_plr_state_air, v_plr_state_attack);
scr_state_addconnect(v_plr_state_air, v_plr_state_defend);
scr_state_addconnect(v_plr_state_air, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_air, v_plr_state_gnd_run);
scr_state_addconnect(v_plr_state_air, v_plr_state_wall_stick);
//scr_state_addconnect(v_plr_state_air, v_plr_state_slam);

// crouch
scr_state_addconnect(v_plr_state_gnd_crouch, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_gnd_crouch, v_plr_state_gnd_run);
scr_state_addconnect(v_plr_state_gnd_crouch, v_plr_state_defend);
scr_state_addconnect(v_plr_state_gnd_crouch, v_plr_state_attack_crouch);
scr_state_setconnects(v_plr_state_attackctocrouch, v_plr_state_gnd_crouch);

// wall_stick
scr_state_addconnect(v_plr_state_wall_stick, v_plr_state_wall_jump);

// wall_jump
scr_state_addconnect(v_plr_state_wall_jump, v_plr_state_air);
scr_state_addconnect(v_plr_state_wall_jump, v_plr_state_wall_stick);

// ladder_up
scr_state_addconnect(v_plr_state_ladder_up, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_ladder_up, v_plr_state_ladder_down);
scr_state_addconnect(v_plr_state_ladder_up, v_plr_state_ladder_idle);
scr_state_addconnect(v_plr_state_ladder_up, v_plr_state_air);
scr_state_addconnect(v_plr_state_ladder_up, v_plr_state_ladder_fall);

// ladder_down
scr_state_addconnect(v_plr_state_ladder_down, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_ladder_down, v_plr_state_ladder_up);
scr_state_addconnect(v_plr_state_ladder_down, v_plr_state_ladder_idle);
scr_state_addconnect(v_plr_state_ladder_down, v_plr_state_air);
scr_state_addconnect(v_plr_state_ladder_down, v_plr_state_ladder_fall);

// ladder_idle
scr_state_addconnect(v_plr_state_ladder_idle, v_plr_state_ladder_up);
scr_state_addconnect(v_plr_state_ladder_idle, v_plr_state_ladder_down);
scr_state_addconnect(v_plr_state_ladder_idle, v_plr_state_air);
scr_state_addconnect(v_plr_state_ladder_idle, v_plr_state_ladder_fall);

// ladder_fall
scr_state_addconnect(v_plr_state_ladder_fall, v_plr_state_air);
scr_state_addconnect(v_plr_state_ladder_fall, v_plr_state_ladder_idle);

// attack
scr_state_addconnect(v_plr_state_attack, v_plr_state_air);
scr_state_addconnect(v_plr_state_attack, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_attack, v_plr_state_gnd_run);

// attack_crouch
scr_state_addconnect(v_plr_state_attack_crouch, v_plr_state_attackctocrouch);
scr_state_addconnect(v_plr_state_attack_crouch, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_attack_crouch, v_plr_state_gnd_run);

// defend
scr_state_addconnect(v_plr_state_defend, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_defend, v_plr_state_gnd_run);
scr_state_addconnect(v_plr_state_defend, v_plr_state_air);

// slam
scr_state_addconnect(v_plr_state_slam, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_slam, v_plr_state_gnd_run);

// ram
scr_state_addconnect(v_plr_state_ram, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_ram, v_plr_state_gnd_run);

// hurt state
scr_state_addconnect(v_act_state_hurt, v_plr_state_gnd_idle);
scr_state_addconnect(v_act_state_hurt, v_plr_state_gnd_run);
scr_state_addconnect(v_act_state_hurt, v_plr_state_air);
scr_state_addconnect(v_act_state_hurt, v_plr_state_ladder_idle);

// altrun scripts
scr_state_addaltrun(v_plr_state_gnd_idle, v_plr_state_wall_stick);
scr_state_addaltrun(v_plr_state_gnd_crouch, v_plr_state_wall_stick);
scr_state_addaltrun(v_plr_state_gnd_run, v_plr_state_wall_stick);

