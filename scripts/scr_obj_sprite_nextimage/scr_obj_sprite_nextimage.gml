/// @description scr_plr_sprite_nextimage(global.player)
function scr_obj_sprite_nextimage(argument0) {

	/// @param global.player

	if (argument0.image_index < argument0.image_number - 1) argument0.image_index = floor(argument0.image_index + 1);
	else argument0.image_index = 0;


}
