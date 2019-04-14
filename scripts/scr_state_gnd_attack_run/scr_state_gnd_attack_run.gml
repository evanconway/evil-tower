/// @description scr_state_gnd_attack_run(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

scr_state_deccount(state);


// We're handling sprite animation manually, but we may decide to change this later
ID.image_speed = 0;

switch (state.v_state_attack_stage) {
	case enum_attack_stage.startup:
	ID.image_index = 0;
	if (state.v_state_count <= 0) {	
		var hitbox = instance_create_layer(ID.x, ID.y, "Hitboxes", state.v_state_attack_hitbox); 
		hitbox.v_hitbox_hitter = ID;
		hitbox.v_hitbox_time = state.v_state_attack_recovery + 2; // Need to learn why 2 works
		if (ID.v_act_faceright) hitbox.x += state.v_state_attack_offset_x;
		else {
			hitbox.x -= state.v_state_attack_offset_x;
			hitbox.v_hitbox_vel_x *= -1;
		}
		hitbox.y += state.v_state_attack_offset_y;
		ID.image_index = 1;
		state.v_state_attack_stage = enum_attack_stage.recovery;
		state.v_state_count = state.v_state_attack_recovery;
	}
	break;
	case enum_attack_stage.recovery:
	if (state.v_state_count <= 0) {
		state.v_state_attack_stage = enum_attack_stage.finished;
	}
	break;
	case enum_attack_stage.finished:
	break;
}
