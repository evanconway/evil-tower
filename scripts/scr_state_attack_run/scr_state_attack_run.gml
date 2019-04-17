/// @description scr_state_gnd_attack_run(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

scr_state_deccount(state);

// We're handling sprite animation manually, but we may decide to change this later
ID.image_speed = 0;

if (place_meeting(ID.x, ID.y + 1, o_wall)){
	ID.v_act_vel_x = 0;
	ID.v_act_vel_y = 0;
} else {
	if (ID.v_act_vel_y >= 0 && ID.v_act_actcon.v_actcon_pressed_down) ID.v_act_vel_y = ID.v_act_vel_y_max;
	scr_act_calcairvals(ID, ID.v_act_grv, 0.15);
}
switch (state.v_state_attack_stage) {
	case enum_attack_stage.startup:
	ID.image_index = 0;
	if (state.v_state_count <= 0) {	
		var hitbox = instance_create_layer(ID.x, ID.y, "Hitboxes", state.v_state_attack_hitbox); 
		hitbox.v_hitbox_hitter = ID;
		// same as below, we need it here for projectiles
		if (ID.v_act_faceright) hitbox.x = scr_act_potxpos(ID.x, ID.v_act_vel_x) + state.v_state_attack_offset_x;
		else hitbox.x = scr_act_potxpos(ID.x, ID.v_act_vel_x) - state.v_state_attack_offset_x;
		hitbox.y = scr_act_potypos(ID.y, ID.v_act_vel_y) + state.v_state_attack_offset_y;
		
		if (!ID.v_act_faceright) hitbox.v_hitbox_vel_x *= -1;
		ID.image_index = 1;
		state.v_state_attack_stage = enum_attack_stage.recovery;
		state.v_state_count = state.v_state_attack_recovery;
		
		if (!hitbox.v_hitbox_permenant) {
			state.v_state_attack_hitboxID = hitbox;
			hitbox.v_hitbox_hitterstate = ID.v_act_state_cur;
		}
	}
	break;
	case enum_attack_stage.recovery:
	if (state.v_state_attack_hitboxID != undefined) {
		if (ID.v_act_faceright) state.v_state_attack_hitboxID.x = scr_act_potxpos(ID.x, ID.v_act_vel_x) + state.v_state_attack_offset_x;
		else state.v_state_attack_hitboxID.x = scr_act_potxpos(ID.x, ID.v_act_vel_x) - state.v_state_attack_offset_x;
		state.v_state_attack_hitboxID.y = scr_act_potypos(ID.y, ID.v_act_vel_y) + state.v_state_attack_offset_y;
	}
	if (state.v_state_count <= 0) {
		state.v_state_attack_stage = enum_attack_stage.finished;
		if (state.v_state_attack_hitboxID != undefined) {
			instance_destroy(state.v_state_attack_hitboxID);
			state.v_state_attack_hitboxID = undefined;
		}
	}
	break;
	case enum_attack_stage.finished:
	break;
}
