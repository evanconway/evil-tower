event_inherited();
if (!instance_exists(id)) exit;

v_act_ai = instance_create_layer(x, y, "Enemies", o_ai_wander);
v_act_ai.v_ai_actor = id;

// states
// idle
v_emy_zombie_state_gnd_idle = instance_create_layer(x, y, "Enemies", o_state_gnd_idle);
v_emy_zombie_state_gnd_idle.v_state_sprite = s_emy_zombie_gnd_idle;
v_emy_zombie_state_gnd_idle.v_state_sprite_left = s_emy_zombie_gnd_idle_left;

v_act_state_default = v_emy_zombie_state_gnd_idle;

v_emy_zombie_state_gnd_run = instance_create_layer(x, y, "Enemies", o_state_gnd_run);
v_emy_zombie_state_gnd_run.v_state_sprite = s_emy_zombie_gnd_walk;
v_emy_zombie_state_gnd_run.v_state_sprite_left = s_emy_zombie_gnd_walk_left;
v_emy_zombie_state_gnd_run.v_state_gnd_run_maxx = 0.5;

// remember hurt must connect to almost all states
scr_state_addconnect(v_act_state_hurt, v_emy_zombie_state_gnd_idle);
scr_state_addconnect(v_act_state_hurt, v_emy_zombie_state_gnd_run);

scr_state_addconnect(v_emy_zombie_state_gnd_idle, v_emy_zombie_state_gnd_run);

scr_state_addconnect(v_emy_zombie_state_gnd_run, v_emy_zombie_state_gnd_idle);