/// @description scr_state_ram_change(o_actor)
/// @param actor_id
function scr_state_ram_change() {

	var ID = argument[0];
	var state = ID.v_act_state_cur;

	scr_state_changesprite(ID);

	state.v_state_count = state.v_state_ram_startup;
	state.v_state_ram_stage = 0;
	state.v_state_ram_finished = false;
	if (ID.v_act_actcon.v_actcon_right) state.v_state_ram_faceright = true;
	else state.v_state_ram_faceright = false;

	state.v_state_ram_hitbox_Xogknockback = ID.v_act_hitbox.v_hitbox_knock_x;
	state.v_state_ram_hitbox_Yogknockback = ID.v_act_hitbox.v_hitbox_knock_y;

	ID.v_act_hitbox.v_hitbox_knock_x *= -3;
	ID.v_act_hitbox.v_hitbox_knock_y *= 2;



}
