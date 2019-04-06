event_inherited();

// states
// idle
v_emy_zombie_state_gnd_idle = instance_create_layer(x, y, "Enemies", o_state_gnd_idle);
v_emy_zombie_state_gnd_idle.v_state_sprite = s_emy_zombie_gnd_idle;
v_emy_zombie_state_gnd_idle.v_state_sprite_left = s_emy_zombie_gnd_idle_left;

v_act_state_default = v_emy_zombie_state_gnd_idle;

scr_state_addconnect(v_act_state_hurt, v_emy_zombie_state_gnd_idle);