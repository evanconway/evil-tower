event_inherited();

// zombie hitbox
v_act_hitbox = instance_create_layer(x, y, "Hitboxes", o_hitbox);
v_act_hitbox.sprite_index = sprite_index; //use the same sprite as the enemy
v_act_hitbox.v_hitbox_target = o_player;
v_act_hitbox.v_hitbox_stun = 4;
v_act_hitbox.v_hitbox_permenant = true;
v_act_hitbox.v_hitbox_damage = 1;

v_act_dead_fx = o_fx_explosion;

// zombie states
// hurt (remember enemies already have a hurt state made for them)
v_act_state_hurt.v_state_count_max = 20;
v_act_state_hurt.v_state_hurt_health = 3;
v_act_state_hurt.v_state_hurt_knock_y = -1.5;
v_act_state_hurt.v_state_hurt_vel_y_max = 3;

v_emy_zombie_state_gnd_idle = instance_create_layer(x, y, "Enemies", o_state_gnd_idle);
v_emy_zombie_state_gnd_idle.v_state_sprite = s_emy_zombie_gnd_idle;
v_emy_zombie_state_gnd_idle.v_state_sprite_left = s_emy_zombie_gnd_idle_left;

v_act_state_default = v_emy_zombie_state_gnd_idle;

scr_state_addconnect(v_act_state_hurt, v_emy_zombie_state_gnd_idle);