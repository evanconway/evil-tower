/// @description scr_plr_sprite_nextimage(o_player)

/// @param o_player

if (argument0.image_index < argument0.image_number - 1) argument0.image_index = floor(argument0.image_index + 1);
else argument0.image_index = 0;