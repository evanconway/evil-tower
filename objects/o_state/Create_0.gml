/// @description Insert description here
// You can write your code in this editor

v_state_connections = ds_list_create(); // this list is filled with o_state objects
v_state_script_connect = undefined; // determines if actor can enter this state
v_state_script_continue = undefined; // determines if other connects are checked
v_state_script_change = undefined; // executed when changing to this state
v_state_script_run = undefined;
v_state_script_connect_postrun = undefined;
v_state_script_continue_postrun = scr_state_returntrue;
v_state_script_change_postrun = scr_state_changesprite;
v_state_sprite = undefined;
v_state_sprite_left = undefined;
v_state_draw_behind = undefined; // behind and front are in reference to the actor
v_state_draw_front = undefined;
v_state_name = undefined;
