event_inherited();

v_act_vel_x = 0.8;
v_act_vel_runaccel = 0.8//v_act_vel_x;

enum enum_fireball_state {
	moving,
	hit
}

v_fireball_state = enum_fireball_state.moving;

v_fireball_stuntime_max = 8;
v_fireball_stuntime = v_fireball_stuntime_max;

v_fireball_hitboxes_struck = ds_list_create();

v_fireball_health = 2;

v_fireball_hitxoffset = 15;
v_act_explosion_y_offset = -10;