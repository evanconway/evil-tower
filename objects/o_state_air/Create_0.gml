event_inherited();

v_state_name = "air";

v_state_script_connect = scr_state_air_connect;
v_state_script_change = scr_state_changesprite;
v_state_script_run = scr_state_air_run;

v_state_air_accx = 0.15;
v_state_air_grv = 0.15;// gravity
v_state_air_fastfall = true;
v_state_air_spritedn = undefined;
v_state_air_spritedn_left = undefined;

//we use state count for wall slide smoke
v_state_count_max = 3;
