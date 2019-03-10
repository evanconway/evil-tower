/// @description scr_state_changesprite_spd1(actor_id)

/// @param actor_id

var ID = argument[0];

ID.image_index = 0;

if (ID.v_act_state_cur.v_state_sprite_left != undefined) {
	if (ID.v_act_faceright) ID.sprite_index = ID.v_act_state_cur.v_state_sprite;
	else ID.sprite_index = ID.v_act_state_cur.v_state_sprite_left;
} else if (ID.v_act_state_cur.v_state_sprite != undefined) {
	ID.sprite_index = ID.v_act_state_cur.v_state_sprite;
}
