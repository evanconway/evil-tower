event_inherited();

/*
By default, we assume created attack states are on the ground. Air attack
scripts will have to be assigned at state creation.
*/
v_state_script_continue = scr_state_attack_continue;
v_state_script_connect = scr_state_gnd_attack_connect;
v_state_script_change = scr_state_gnd_attack_change;
v_state_script_run = scr_state_gnd_attack_run;

v_state_attack_startup = 15;
v_state_attack_recovery = 15;
v_state_attack_hitbox = o_hitbox;
v_state_attack_target = o_player; // parent object, will be either o_player or o_emy
v_state_attack_offset_x = 24; // arbitrary numbers to get us started
v_state_attack_offset_y = -2;

enum enum_attack_stage {
	startup,
	recovery,
	finished
}

v_state_attack_stage = enum_attack_stage.startup;
