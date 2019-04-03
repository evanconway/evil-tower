event_inherited()
v_state_name = "Hurt";
v_state_script_continue = scr_state_hurt_continue;
v_state_script_run = scr_state_hurt_run;

v_state_count_max = 60;
v_state_count = v_state_count_max;

v_state_hurt_health = 3;

v_state_hurt_knock_x = 1.3;
v_state_hurt_knock_y = -1.3;
v_state_hurt_grv_y = 0.15;
v_state_hurt_vel_y = 0;
v_state_hurt_vel_y_max = 3.0;
