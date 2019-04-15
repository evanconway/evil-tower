event_inherited();
if (!instance_exists(id)) exit;

// hurt state
v_act_state_hurt = instance_create_layer(x, y, "Enemies", o_state_hurt);
v_act_state_hurt.v_state_count_max = 20;
v_act_state_hurt.v_state_hurt_health = 3;
v_act_state_hurt.v_state_hurt_vel_y_max = 3;
v_act_state_hurt.v_state_hurt_dead_fx = o_fx_explosion;
v_act_state_hurt.v_state_hurt_dead_snd = snd_emy_explosion
v_act_state_hurt.v_state_hurt_fx_yoffset = (bbox_bottom - bbox_top) / 2;

// hitbox
v_act_hitbox = instance_create_layer(x, y, "Hitboxes", o_hitbox);
v_act_hitbox.v_hitbox_hitter = id;
v_act_hitbox.sprite_index = sprite_index; //use the same sprite as the enemy
v_act_hitbox.v_hitbox_effect = undefined;
v_act_hitbox.v_hitbox_target = global.player;
v_act_hitbox.v_hitbox_stun = 20;
v_act_hitbox.v_hitbox_permenant = true;
v_act_hitbox.v_hitbox_damage = 1;
