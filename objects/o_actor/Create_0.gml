/// @description Declare Actor Variables

v_act_bbox_color = c_lime;
v_act_health = 3;
v_act_state = 0;
v_act_state_beforehit = 0;
v_act_stuntime = 0;
v_act_hitboxes_struck = ds_list_create();

//movement
v_act_vel_x = 0;//variable_player_speed_horizontal
v_act_vel_y = 0;//vertical
v_act_vel_x_max = 1;
v_act_vel_y_max = 1;
v_act_vel_runaccel = v_act_vel_x_max;
v_act_jumppwr = -1;//jump power
v_act_grv = 0.1;//gravity
v_act_hurtjump = -1
v_act_vel_airxaccel = 0.1;
v_act_input_x = 0;//horizontal movement input (-1 = left, 1 = right, 0 = none)
v_act_input_y = 0;//vertical movement input (-1 = up, 1 = down, 0 = none)
v_act_input_x_prev = 0;
v_act_input_y_prev = 0;
v_act_input_x_start = x;
v_act_input_y_start = y;
v_act_xmovedist = 0;
v_act_ymovedist = 0;
v_act_faceright = true;
v_act_faceright_prev = v_act_faceright;

v_act_explosion_y_offset = 0;