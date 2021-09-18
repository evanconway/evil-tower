/// @description scr_state_ladder_up_change(o_actor)
function scr_state_ladder_up_change() {

	/// @param actor_id

	var ID = argument[0];
	var state = ID.v_act_state_cur;

	if (ID.sprite_index != state.v_state_sprite) scr_state_changesprite(ID);



}
