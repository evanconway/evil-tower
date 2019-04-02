event_inherited();

v_plr_data = false;

v_act_aiscript = scr_actor_getuserinput;

v_plr_vel_x_max = 1.6;
v_plr_vel_y_max = 3.5;
v_plr_jump_pwr = -3.7;
v_plr_climbspd = v_plr_vel_x_max * 0.7;

// states
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


//v_plr_state_attack = instance_create_layer(o_state_attack, "Player");

// state connections
// idle
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_ladder_up);
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_ladder_down); // we have to check for ladder down before crouch
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_gnd_crouch);
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_gnd_run);
scr_state_addconnect(v_plr_state_gnd_idle, v_plr_state_air_up);

// run
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


// altrun scripts
scr_state_addaltrun(v_plr_state_gnd_idle, v_plr_state_wall_stick);
scr_state_addaltrun(v_plr_state_gnd_crouch, v_plr_state_wall_stick);
scr_state_addaltrun(v_plr_state_gnd_run, v_plr_state_wall_stick);
scr_state_addaltrun(v_plr_state_airdntorun, v_plr_state_wall_stick);

// alwaysrun? (we may need to add a script to states that run every frame)






// enumerators must be left in-tact or scripts break and game won't compile
// We should be able to delete all the set state scripts at some point. 
enum enum_plr_ladder_check_move {
	stillonladder,
	hitwall,
	touchingnothing,
	nothingbutonground
}

//states
enum enum_plr_state {//animation (anm)
	gnd_idle,
	gnd_run,
	gnd_struggle, // not bothering to reimplement
	gnd_crouch,
	gnd_attack,
	gnd_crouchattack,
	air_up,
	air_dn,
	air_atack,
	wall_slide,
	ladder_idle,
	ladder_up,
	ladder_dn,
	ladder_fall,
	hurt,
	hurt_ladder,
	dead,
	door,
	elevator,
	spawn
}

/* OLD CODE 
v_act_bbox_color = c_aqua;
//movement
v_act_vel_x_max = 1.6;//run speed
v_act_vel_y_max = 3.5;
v_act_vel_runaccel = v_act_vel_x_max;
v_act_jumppwr = -4.3;//jump power
v_act_grv = 0.15;//gravity
v_act_hurtjump = -2
v_act_vel_airxaccel = 0.1;
v_plr_air_deccel = -0.3;

v_plr_canfastfall = true;
v_plr_fastfallspd = 0.8 * v_act_vel_y_max;

v_plr_crouch_dist = 5;

v_plr_walljump_dist = 7;
v_plr_walljump_prev = 0;
v_plr_wallgrv = 0.08;
v_plr_wall_vely_max = 0.2 * v_act_vel_y_max;
v_plr_jump_committime_max = 20;
v_plr_jump_committime = 0;

v_plr_walljump_time_max = 14;
v_plr_walljump_time = 0;

v_plr_hassword = true;

//input
v_plr_key_left = false;
v_plr_key_right = false;
v_plr_key_up = false;
v_plr_key_dn = false;//down (dn)
v_plr_key_jump = false;
v_plr_hascontrol = true;

//debug
v_plr_boxlength = 67;
v_plr_key_constant_left = false;
v_plr_key_constant_right = false;
v_plr_key_constant_up = false;
v_plr_key_constant_dn = false;
v_plr_input_lock = false;

//hurt
v_plr_emyhit = false;
v_plr_hurttime = 0;
v_plr_hurttime_max = 30;
v_plr_invulnerabletime = 0;
v_plr_invulnerabletime_max = 100;
v_plr_hitx = 0;
v_plr_emyhitx = 0;
//global.player_health = global.player_health_max;
v_plr_waittoshowdeath_max = 80;
v_plr_waittoshowdeath = v_plr_waittoshowdeath_max;

//ladders
v_plr_ladder_on_obj = false;
v_plr_ladder_climbsp = 0.8;
v_plr_climbdelay_max = 10;
v_plr_climbdelay = v_plr_climbdelay_max;
v_plr_climbdirchangedelay_max = 12;
v_plr_previndex = image_index; 
v_plr_ladder_canjump = true;

//attacking
v_plr_attack_startup_max = 10;
v_plr_attack_swing_max = 8;
v_plr_attack_recovery_max = 2;
v_plr_attack_startup = 0;
v_plr_attack_swing = 0;
v_plr_attack_recovery = 0;

v_plr_attack_stage = enum_attack_stage.startup;

v_plr_swordhitbox_x = 18;
v_plr_swordhitbox_y = -2;

v_plr_crouchhitbox_x = 15;
v_plr_crouchhitbox_y = 12;

//doors
v_plr_door_yoffset = 4;

enum enum_plr_ladder_check_move {
	stillonladder,
	hitwall,
	touchingnothing,
	nothingbutonground
}

//states
enum enum_plr_state {//animation (anm)
	gnd_idle,
	gnd_run,
	gnd_struggle,
	gnd_crouch,
	gnd_attack,
	gnd_crouchattack,
	air_up,
	air_dn,
	air_atack,
	wall_slide,
	ladder_idle,
	ladder_up,
	ladder_dn,
	ladder_fall,
	hurt,
	hurt_ladder,
	dead,
	door,
	elevator,
	spawn
}

v_plr_state = enum_plr_state.spawn;
scr_plr_setstate(id, enum_plr_state.spawn)
