/// @description Insert description here
// You can write your code in this editor

if (v_hitbox_time > 0) v_hitbox_time--;
else instance_destroy(id);

if (place_meeting(x, y, o_emy) && !v_hit_emy) {
	v_hit_emy = true;
	audio_stop_sound(snd_swordswing);
}