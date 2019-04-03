/// @description Detect Player Collision

if (place_meeting(x, y, o_player)) {
	var plr = instance_place(x, y, o_player);
	scr_obj_hurt_act(id, plr, v_emy_damage);
}
