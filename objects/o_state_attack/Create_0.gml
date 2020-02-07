event_inherited();

// We decided to lump air and ground attacks together.

v_state_name = "attack";
v_state_script_continue = scr_state_attack_continue;
v_state_script_connect = scr_state_attack_connect;
v_state_script_change = scr_state_attack_change;
v_state_script_run = scr_state_attack_run;

v_state_attack_startup = 15;
v_state_attack_recovery = 15; // this also sets the v_hitbox_time variable
v_state_attack_offset_x = 18; // changes hitbox position, arbitrary numbers to get us started
v_state_attack_offset_y = -17;

enum enum_attack_stage {
	startup,
	recovery,
	finished
}

v_state_attack_stage = enum_attack_stage.startup;

v_state_attack_hitbox = o_hitbox;
v_state_attack_hitboxID = undefined;
