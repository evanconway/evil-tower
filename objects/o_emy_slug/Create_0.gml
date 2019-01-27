event_inherited();

v_act_vel_x_max = 0.4;
v_act_vel_runaccel = v_act_vel_x_max;

enum enum_slug_state {
	idle,
	moving,
	attack,
	hit
}


v_slug_state = enum_slug_state.idle;
v_slug_attack_state = enum_attack_stage.startup;

v_slug_time_max = 120;
v_slug_time_min = 30;
v_slug_statetime = 0;//I don't know why this is 5?

v_slug_attack_startup = 20;
v_slug_attacktime = 30;

v_slug_stuntime_max = 8;
v_slug_stuntime = v_slug_stuntime_max;
v_slug_hitboxes_struck = ds_list_create();
v_slug_statebeforehit = global.novalue;

v_slug_health = 1;

v_act_explosion_y_offset = -10;