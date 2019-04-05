/// @description Detect Collisions With Target

if (v_hitbox_target != undefined && instance_exists(v_hitbox_target)) {
	if (place_meeting(x, y, v_hitbox_target)) {
		var target = instance_place(x, y, v_hitbox_target);
		var hitterx = x;
		if (v_hitbox_hitter != undefined) hitterx = v_hitbox_hitter.x;
		scr_hitbox_hurt_act(id, target, v_hitbox_damage, hitterx, v_hitbox_stun);
	} else if (v_hitbox_firstcheck) scr_playsfx(v_hitbox_snd_miss);
} else if (v_hitbox_firstcheck) scr_playsfx(v_hitbox_snd_miss);
v_hitbox_firstcheck = false;
if (!v_hitbox_permenant) {
	v_hitbox_time--;
	if (v_hitbox_time <= 0) instance_destroy(id);
}