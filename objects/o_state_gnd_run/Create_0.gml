event_inherited();

v_state_name = "gnd_run";
v_state_script_change = scr_state_changesprite;
v_state_script_connect = scr_state_gnd_run_connect;
v_state_script_run = scr_state_gnd_run_run;

v_state_gnd_run_maxx = 1.6;
v_state_gnd_run_accx = v_state_gnd_run_maxx;
