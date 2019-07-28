event_inherited();
v_state_name = "ram";

v_state_script_continue = scr_state_ram_continue;
v_state_script_connect = scr_state_ram_connect;
v_state_script_change = scr_state_ram_change;
v_state_script_run = scr_state_ram_run;
v_state_script_altrun = scr_state_ram_altrun;

v_state_ram_stage = 0;
v_state_ram_finished = false;
v_state_ram_faceright = true;
v_state_count_max = 10;// frequency of fx creation
v_state_ram_fx = undefined;
v_state_ram_rest = 45; // frames of rest after hitting wall
v_state_ram_hitbox_Xogknockback = 0;
v_state_ram_hitbox_Yogknockback = 0;

v_state_ram_donesprite = undefined;
v_state_ram_donesprite_left = undefined;
