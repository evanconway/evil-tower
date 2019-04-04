/// @description Detect Collisions With Target

if (v_hitbox_target != undefined && instance_exists(v_hitbox_target)) {
	if (place_meeting(x, y, v_hitbox_target)) {
		var target = instance_place(x, y, v_hitbox_target);
		scr_obj_hurt_act(id, target, v_hitbox_damage);
	}
}

v_hitbox_time--;
if (v_hitbox_time <= 0) instance_destroy(id);