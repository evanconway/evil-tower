event_inherited();

v_state_name = "ldr_down";

v_state_script_continue = scr_state_ladder_down_continue;
v_state_script_connect = scr_state_ladder_down_connect;
v_state_script_change = scr_state_ladder_down_change;
v_state_script_run = scr_state_ladder_down_run;
v_state_script_continue_postrun = scr_state_ladder_down_continue_postrun;

 // for when actor is descending ladder from o_wall and no o_ladder meeting
v_state_ladder_down_stepdown = false;
