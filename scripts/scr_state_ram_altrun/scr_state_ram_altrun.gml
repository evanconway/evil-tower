/// @description scr_state_ram_altrun(actor_id, state_id)
/// @param o_actor
/// @param o_state

var ID = argument[0];
var state = argument[1];

ID.v_act_hitbox.v_hitbox_knock_x = state.v_state_ram_hitbox_Xogknockback;
ID.v_act_hitbox.v_hitbox_knock_y = state.v_state_ram_hitbox_Yogknockback;