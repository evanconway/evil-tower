event_inherited();
if (!instance_exists(id)) exit;

v_act_ai = instance_create_layer(x, y, "Enemies", o_ai_wander_noidle);
v_act_ai.v_ai_actor = id;

// states
v_act_state_hurt.v_state_sprite = s_slug_giant;
v_act_state_hurt.v_state_sprite_left = s_slug_giant_left;

v_emy_slugboss_state_gnd_idle = instance_create_layer(x, y, "Enemies", o_state_gnd_idle);
v_emy_slugboss_state_gnd_idle.v_state_sprite = s_slug_giant;
v_emy_slugboss_state_gnd_idle.v_state_sprite_left = s_slug_giant_left;

v_act_state_default = v_emy_slugboss_state_gnd_idle;

v_emy_slugboss_state_gnd_run = instance_create_layer(x, y, "Enemies", o_state_gnd_run);
v_emy_slugboss_state_gnd_run.v_state_sprite = s_slug_giant;
v_emy_slugboss_state_gnd_run.v_state_sprite_left = s_slug_giant_left;
v_emy_slugboss_state_gnd_run.v_state_gnd_run_maxx = 0.7;

// remember hurt must connect to almost all states
scr_state_addconnect(v_act_state_hurt, v_emy_slugboss_state_gnd_idle);
scr_state_addconnect(v_act_state_hurt, v_emy_slugboss_state_gnd_run);

scr_state_addconnect(v_emy_slugboss_state_gnd_idle, v_emy_slugboss_state_gnd_run);

scr_state_addconnect(v_emy_slugboss_state_gnd_run, v_emy_slugboss_state_gnd_idle);
