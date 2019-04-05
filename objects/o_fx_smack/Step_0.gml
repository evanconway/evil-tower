/// @description Insert description here
// You can write your code in this editor

var numofframes = sprite_get_number(s_hit_effect);
if (floor(image_index) == numofframes - 1) instance_destroy(id);