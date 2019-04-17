/// @description scr_state_air_up_run(actor_id)

/// @param o_actor

var ID = argument[0];
var state = ID.v_act_state_cur;

// fastfall, done before air val calculation
if (ID.v_act_actcon.v_actcon_pressed_down && 
	state.v_state_air_fastfall &&
	ID.v_act_vel_y >= 0) ID.v_act_vel_y = ID.v_act_vel_y_max;
	
scr_act_calcairvals(ID, state.v_state_air_grv, state.v_state_air_accx);
if (ID.v_act_vel_x > 0) ID.v_act_faceright = true;
if (ID.v_act_vel_x < 0) ID.v_act_faceright = false;

if (state.v_state_sprite != undefined && ID.v_act_faceright) ID.sprite_index = state.v_state_sprite;
if (state.v_state_sprite_left != undefined && !ID.v_act_faceright) ID.sprite_index = state.v_state_sprite_left;

if (ID.v_act_vel_y >= 0) {
	if (state.v_state_air_spritedn != undefined && ID.v_act_faceright) ID.sprite_index = state.v_state_air_spritedn;
	if (state.v_state_air_spritedn_left != undefined && !ID.v_act_faceright) ID.sprite_index = state.v_state_air_spritedn_left;
}
