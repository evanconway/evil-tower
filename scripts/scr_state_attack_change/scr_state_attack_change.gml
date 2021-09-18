/// @description scr_state_gnd_attack_change(o_actor)
/// @param actor_id
function scr_state_attack_change() {

	var ID = argument[0];
	var state = ID.v_act_state_cur;

	state.v_state_attack_stage = enum_attack_stage.startup;
	state.v_state_count = state.v_state_attack_startup;
	state.v_state_attack_hitboxID = undefined;
	if (ID.v_act_actcon.v_actcon_right && !ID.v_act_actcon.v_actcon_left) ID.v_act_faceright = true;
	if (!ID.v_act_actcon.v_actcon_right && ID.v_act_actcon.v_actcon_left) ID.v_act_faceright = false;
	scr_state_changesprite(ID); // note this is after we determine faceright



}
