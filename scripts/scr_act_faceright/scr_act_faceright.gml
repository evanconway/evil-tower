/// @description scr_act_faceright(o_actor, bool)
/// @param actor_id
/// @param rightorleft
function scr_act_faceright() {

	/*
	If the current state of the actor has a sprite for left or right,
	this script sets the actor to right sprite if true, left if false.
	*/

	var ID = argument[0];
	var right = argument[1];
	var state = ID.v_act_state_cur;

	if (state.v_state_sprite != undefined && right) ID.sprite_index = state.v_state_sprite;
	if (state.v_state_sprite_left != undefined && !right) ID.sprite_index = state.v_state_sprite_left;


}
