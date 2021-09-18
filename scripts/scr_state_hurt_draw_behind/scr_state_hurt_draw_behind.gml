/// @description scr_state_hurt_draw_behind(o_actor)
/// @param actor_id
function scr_state_hurt_draw_behind() {

	var ID = argument[0];

	if (ID.v_act_state_hurt.v_state_hurt_health <= 0) {
		draw_set_alpha(0.6);
		draw_set_color(c_black);
		draw_rectangle(0, 0, room_width, room_height, false);
	}



}
