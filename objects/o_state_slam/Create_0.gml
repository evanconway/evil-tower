/// @description 

/*
This is basically the ground pound from mario games. It can only be done in the air. 
Once started, the character freezes in air for a moment, then moves straight down at 
a fast speed. Landing on the ground causes camera shake and stuns the player. At some
point we may want to program this so it can work in other situations than just as a 
boss attack. 
*/

v_state_script_continue = scr_state_slam_continue;
v_state_script_connect = scr_state_slam_connect;

v_state_slam_finished = false;
v_state_slam_stage = 0;

v_state_slam_sprite_dn = undefined;
v_state_slam_sprite_dn_left = undefined;
v_state_slam_sprite_land = undefined;
v_state_slam_sprite_land_left = undefined;
