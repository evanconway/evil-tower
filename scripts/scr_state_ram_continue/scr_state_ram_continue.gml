/// @description scr_state_ram_continue(o_actor)
/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

var result = true;

result = !state.v_state_ram_finished;

with (ID) {
	if (!place_meeting(x, y+1, o_wall)) result = false;
}

if (!result) {
	ID.v_act_hitbox.v_hitbox_knock_x = state.v_state_ram_hitbox_Xogknockback;
	ID.v_act_hitbox.v_hitbox_knock_y = state.v_state_ram_hitbox_Yogknockback;
}

return result;