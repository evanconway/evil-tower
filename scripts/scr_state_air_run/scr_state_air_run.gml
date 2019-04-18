/// @description scr_state_air_up_run(actor_id)

/// @param o_actor

var ID = argument[0];
var state = ID.v_act_state_cur;
	
scr_act_calcairvals(ID);
if (ID.v_act_vel_x > 0) ID.v_act_faceright = true;
if (ID.v_act_vel_x < 0) ID.v_act_faceright = false;

if (state.v_state_sprite != undefined && ID.v_act_faceright) ID.sprite_index = state.v_state_sprite;
if (state.v_state_sprite_left != undefined && !ID.v_act_faceright) ID.sprite_index = state.v_state_sprite_left;

if (ID.v_act_vel_y >= 0) {
	if (state.v_state_air_spritedn != undefined && ID.v_act_faceright) ID.sprite_index = state.v_state_air_spritedn;
	if (state.v_state_air_spritedn_left != undefined && !ID.v_act_faceright) ID.sprite_index = state.v_state_air_spritedn_left;
}
