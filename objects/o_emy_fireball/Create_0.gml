event_inherited();
if (!instance_exists(id)) exit;

v_act_ai = instance_create_layer(x, y, "Enemies", o_ai_patrol);
v_act_ai.v_ai_actor = id;

// states

// idle
v_emy_fireball_state_gnd_idle = instance_create_layer(x, y, "Enemies", o_state_gnd_idle);
v_emy_fireball_state_gnd_idle.v_state_sprite = s_emy_fireball_gnd_idle;

v_act_state_default = v_emy_fireball_state_gnd_idle;

v_emy_fireball_state_gnd_run = instance_create_layer(x, y, "Enemies", o_state_gnd_run);
v_emy_fireball_state_gnd_run.v_state_gnd_run_maxx = 1.2;

// remember hurt must connect to almost all states
scr_state_addconnect(v_act_state_hurt, v_emy_fireball_state_gnd_idle);
scr_state_addconnect(v_act_state_hurt, v_emy_fireball_state_gnd_run);

scr_state_addconnect(v_emy_fireball_state_gnd_idle, v_emy_fireball_state_gnd_run);

scr_state_addconnect(v_emy_fireball_state_gnd_run, v_emy_fireball_state_gnd_idle);