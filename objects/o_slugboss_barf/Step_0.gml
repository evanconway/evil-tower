/// @description Insert description here
// You can write your code in this editor

if (!global.freezeactors) {
	image_speed = 1;
	if (v_act_faceright) v_act_vel_x = v_act_vel_x_max;
	else v_act_vel_x = v_act_vel_x_max * -1;
	v_act_vel_y += v_act_grv;

	event_inherited();

	if (place_meeting(x, y, o_wall)) || 
	(place_meeting(x, y, global.player)) || 
	(place_meeting(x, y, o_hitbox_plr)) {
		instance_destroy(id);
		instance_create_layer(x, y, "Projectiles", o_slug_barf_hit);
		if (abs(x-o_camera.x) < global.sound_boundary_x) && (abs(y-o_camera.y) < global.sound_boundary_y) scr_playsfx(snd_projectile_hitwall);
	}
} else image_speed = 0;