/// @description Insert description here
// You can write your code in this editor
if (!global.freezeactors) {
	image_speed = 1;
	if (image_index >= sprite_get_number(sprite_index) - 1) instance_destroy(id);
} else image_speed = 0;