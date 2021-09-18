/// @description scr_state_hurt_continue(o_actor)
/// @param actor_id
function scr_state_hurt_continue() {

	var ID = argument[0];
	var state = ID.v_act_state_cur; // this will be the hurt state
	var result = false;

	if (state.v_state_count > 0) result = true;
	if (state.v_state_hurt_health <= 0) result = true;

	/*
	Breaking my rules hard here, we're going to set the fade time
	of the actor here since I'm not sure where else to do it.
	*/
	if (!result) ID.v_act_fadetime = ID.v_act_invultime - 1;

	return result;



}
