event_inherited();

v_act_aiscript = scr_actor_getuserinput;

v_plr_data = false;

v_plr_vel_x_max = 1.6;
v_plr_vel_y_max = 3.5;
v_plr_jump_pwr = -3.7;
v_plr_climbspd = v_plr_vel_x_max * 0.7;

// states
v_act_state_hurt = instance_create_layer(x, y, "Player", o_state_hurt);
v_act_state_hurt.v_state_sprite = s_plr_hurt;
v_act_state_hurt.v_state_count_max = 20;
v_act_state_hurt.v_state_hurt_knock_y = -3;
v_act_state_hurt.v_state_hurt_vel_y_max = 3;

v_plr_state_gnd_idle = instance_create_layer(x, y, "Player", o_state_gnd_idle);
v_plr_state_gnd_idle.v_state_sprite = s_plr_gnd_idle_sword;
v_plr_state_gnd_idle.v_state_sprite_left = s_plr_gnd_idle_sword_left

v_act_state_default = v_plr_state_gnd_idle;

v_plr_state_gnd_run = instance_create_layer(x, y, "Player", o_state_gnd_run);
v_plr_state_gnd_run.v_state_sprite = s_plr_gnd_run_sword;
v_plr_state_gnd_run.v_state_sprite_left = s_plr_gnd_run_sword_left;
v_plr_state_gnd_run.v_state_gnd_run_maxx = v_plr_vel_x_max;
#region airdntorun "link state"
/* 
This state only exists to cover a specific state-to-state transition. The run 
animation looks good when going from idle to run, but not from air_dn to run. 
This run is exactly the same as the regular run, but it's change script has 
been altered to set the starting frame to something that looks better (frame 
2 instead of frame 0).
*/
v_plr_state_airdntorun = instance_create_layer(x, y, "Player", o_state_gnd_run);
v_plr_state_airdntorun.v_state_name = "airdntorun";
v_plr_state_airdntorun.v_state_sprite = v_plr_state_gnd_run.v_state_sprite;
v_plr_state_airdntorun.v_state_sprite_left = v_plr_state_gnd_run.v_state_sprite_left;
v_plr_state_airdntorun.v_state_gnd_run_maxx = v_plr_state_gnd_run.v_state_gnd_run_maxx;
v_plr_state_airdntorun.v_state_script_change = scr_state_plr_airdntorun_change;
//v_plr_state_airdntorun.v_state_script_change_postrun = scr_state_plr_airdntorun_change;
#endregion

v_plr_state_gnd_crouch = instance_create_layer(x, y, "Player", o_state_gnd_crouch);
v_plr_state_gnd_crouch.v_state_sprite = s_plr_gnd_crouch_sword;
v_plr_state_gnd_crouch.v_state_sprite_left = s_plr_gnd_crouch_sword_left;

v_plr_state_air_up = instance_create_layer(x, y, "Player", o_state_air_up);
v_plr_state_air_up.v_state_sprite = s_plr_air_up_sword;
v_plr_state_air_up.v_state_sprite_left = s_plr_air_up_sword_left;
v_plr_state_air_up.v_state_air_velx_max = v_plr_vel_x_max;
v_plr_state_air_up.v_state_air_vely_max = v_plr_vel_y_max;
v_plr_state_air_up.v_state_air_up_jumppwr = v_plr_jump_pwr;
v_plr_state_air_up.v_state_sound = snd_jump;
#region hurttoairup
v_plr_state_hurttoairup = instance_create_layer(x, y, "Player", o_state_air_up);
v_plr_state_hurttoairup.v_state_sprite = v_plr_state_air_up.v_state_sprite;
v_plr_state_hurttoairup.v_state_sprite_left = v_plr_state_air_up.v_state_sprite_left;
v_plr_state_hurttoairup.v_state_air_velx_max = v_plr_vel_x_max;
v_plr_state_hurttoairup.v_state_air_vely_max = v_plr_vel_y_max;
v_plr_state_hurttoairup.v_state_air_up_jumppwr = 0;
// no sound for hurt up
#endregion

v_plr_state_air_dn = instance_create_layer(x, y, "Player", o_state_air_dn);
v_plr_state_air_dn.v_state_sprite = s_plr_air_dn_sword;
v_plr_state_air_dn.v_state_sprite_left = s_plr_air_dn_sword_left;
v_plr_state_air_dn.v_state_air_velx_max = v_plr_vel_x_max;
v_plr_state_air_dn.v_state_air_vely_max = v_plr_vel_y_max;

v_plr_state_wall_stick = instance_create_layer(x, y, "Player", o_state_wall_stick);
v_plr_state_wall_stick.v_state_sprite = s_plr_walljump_sword;
v_plr_state_wall_stick.v_state_sprite_left = s_plr_walljump_left_sword;

v_plr_state_wall_jump = instance_create_layer(x, y, "Player", o_state_wall_jump);
v_plr_state_wall_jump.v_state_sprite = s_plr_air_up_sword;
v_plr_state_wall_jump.v_state_sprite_left = s_plr_air_up_sword_left;
v_plr_state_wall_jump.v_state_air_velx_max = v_plr_vel_x_max;
v_plr_state_wall_jump.v_state_air_vely_max = v_plr_vel_y_max;
v_plr_state_wall_jump.v_state_air_up_jumppwr = v_plr_jump_pwr;

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
v_plr_state_ladder_fall.v_state_ladder_fallspd_max = v_plr_vel_y_max;


v_plr_state_gnd_attack = instance_create_layer(x, y, "Player", o_state_attack);
v_plr_state_gnd_attack.v_state_sprite = s_plr_gnd_attack_sword;
v_plr_state_gnd_attack.v_state_sprite_left = s_plr_gnd_attack_sword_left;
v_plr_state_gnd_attack.v_state_attack_target = o_emy;


// state connections
// idle
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_ladder_up);
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_ladder_down); // we have to check for ladder down before crouch
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_gnd_crouch);
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_gnd_attack);
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_gnd_run);
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_air_up);

// run
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_gnd_attack);
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_ladder_up);
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_ladder_down); // has to be before crouch
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_gnd_crouch);
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_air_up);
scr_state_addconnect(v_plr_state_gnd_run, v_plr_state_air_dn);
scr_state_setconnects(v_plr_state_airdntorun, v_plr_state_gnd_run); // this has to be last since the connects must be identical

// crouch
scr_state_addconnect(v_plr_state_gnd_crouch, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_gnd_crouch, v_plr_state_gnd_run);

// air_up
scr_state_addconnect(v_plr_state_air_up, v_plr_state_air_dn);
scr_state_addconnect(v_plr_state_air_up, v_plr_state_wall_stick);
scr_state_setconnects(v_plr_state_hurttoairup, v_plr_state_air_up);

// air_dn
scr_state_addconnect(v_plr_state_air_dn, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_air_dn, v_plr_state_airdntorun);// note we do our unique run instead of regular run
scr_state_addconnect(v_plr_state_air_dn, v_plr_state_wall_stick);

// wall_stick
scr_state_addconnect(v_plr_state_wall_stick, v_plr_state_wall_jump);

// wall_jump
scr_state_addconnect(v_plr_state_wall_jump, v_plr_state_air_dn);
scr_state_addconnect(v_plr_state_wall_jump, v_plr_state_wall_stick);

// ladder_up
scr_state_addconnect(v_plr_state_ladder_up, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_ladder_up, v_plr_state_ladder_down);
scr_state_addconnect(v_plr_state_ladder_up, v_plr_state_ladder_idle);
scr_state_addconnect(v_plr_state_ladder_up, v_plr_state_ladder_fall);
scr_state_addconnect(v_plr_state_ladder_up, v_plr_state_air_dn);

// ladder_down
scr_state_addconnect(v_plr_state_ladder_down, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_ladder_down, v_plr_state_ladder_up);
scr_state_addconnect(v_plr_state_ladder_down, v_plr_state_ladder_idle);
scr_state_addconnect(v_plr_state_ladder_down, v_plr_state_ladder_fall);
scr_state_addconnect(v_plr_state_ladder_down, v_plr_state_air_dn);

// ladder_idle
scr_state_addconnect(v_plr_state_ladder_idle, v_plr_state_ladder_up);
scr_state_addconnect(v_plr_state_ladder_idle, v_plr_state_ladder_down);
scr_state_addconnect(v_plr_state_ladder_idle, v_plr_state_ladder_fall);
scr_state_addconnect(v_plr_state_ladder_idle, v_plr_state_air_dn);

// ladder_fall
scr_state_addconnect(v_plr_state_ladder_fall, v_plr_state_air_dn);
scr_state_addconnect(v_plr_state_ladder_fall, v_plr_state_ladder_idle);

// gnd_attack
scr_state_addconnect(v_plr_state_gnd_attack, v_plr_state_gnd_idle);
scr_state_addconnect(v_plr_state_gnd_attack, v_plr_state_gnd_run);

// hurt state
scr_state_addconnect(v_act_state_hurt, v_plr_state_hurttoairup);
scr_state_addconnect(v_act_state_hurt, v_plr_state_air_dn);
scr_state_addconnect(v_act_state_hurt, v_plr_state_gnd_idle);
scr_state_addconnect(v_act_state_hurt, v_plr_state_gnd_run);
scr_state_addconnect(v_act_state_hurt, v_plr_state_ladder_idle);

// altrun scripts
scr_state_addaltrun(v_plr_state_gnd_idle, v_plr_state_wall_stick);
scr_state_addaltrun(v_plr_state_gnd_crouch, v_plr_state_wall_stick);
scr_state_addaltrun(v_plr_state_gnd_run, v_plr_state_wall_stick);
scr_state_addaltrun(v_plr_state_airdntorun, v_plr_state_wall_stick);


// alwaysrun? (we may need to add a script to states that run every frame)
