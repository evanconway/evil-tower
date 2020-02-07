/// @description scr_state_hurt_run(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;
image_speed = 0;
if (state.v_state_imageindex != undefined 
&& state.v_state_imageindex >= 0 
&& state.v_state_imageindex < sprite_get_number(sprite_index)) image_index = state.v_state_imageindex;
scr_state_deccount(state); // read in continue script, not here

// this line used to have "&& ID.sprite_index != state.v_state_sprite" .... why?
if (state.v_state_sprite != undefined) ID.sprite_index = state.v_state_sprite;
if (state.v_state_sprite_left != undefined && !ID.v_act_faceright) ID.sprite_index = state.v_state_sprite_left;

// velocities are set by knockback values of hitboxes

// the v_state_hurt_ladder gets set by the hitbox, see hitbox code for details
if (state.v_state_hurt_health > 0) {
	
	// this should set the actors invulnerable time when they first get hit, but only when they first get hit.
	if (state.v_state_hurt_invultime > 0 && ID.v_act_invultime == 0) ID.v_act_invultime = state.v_state_hurt_invultime;
	
	if (!state.v_state_hurt_ladder) {
		if (state.v_state_hurt_vel_y < state.v_state_hurt_vel_y_max) state.v_state_hurt_vel_y += state.v_state_hurt_grv_y;
		if (state.v_state_hurt_vel_y > state.v_state_hurt_vel_y_max) state.v_state_hurt_vel_y = state.v_state_hurt_vel_y_max;
		ID.v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(ID, state.v_state_hurt_vel_y, ID.x, o_wall);
		ID.v_act_vel_y = clamp(ID.v_act_vel_y, state.v_state_hurt_vel_y_max *-1, state.v_state_hurt_vel_y_max);
		if (ID.v_act_vel_y == 0) state.v_state_hurt_vel_y = 0;
	
		ID.v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(ID, state.v_state_hurt_vel_x, scr_act_potypos(ID, ID.v_act_vel_y), o_wall);
		ID.v_act_vel_x = clamp(ID.v_act_vel_x, state.v_state_hurt_vel_x_max * -1, state.v_state_hurt_vel_x_max);
		if (state.v_state_count <= 0) {
			if (place_meeting(scr_act_potxpos(ID, ID.v_act_vel_x), scr_act_potypos(ID, ID.v_act_vel_y) + 1, o_wall) && ID.v_act_vel_y == 0) ID.v_act_vel_x = 0;
			if (ID.v_act_vel_x == 0) state.v_state_hurt_vel_x = 0;
		}
	} else scr_state_hurt_ladder_run(ID);
} else {
	ID.v_act_vel_x = 0;
	ID.v_act_vel_y = 0;
}
