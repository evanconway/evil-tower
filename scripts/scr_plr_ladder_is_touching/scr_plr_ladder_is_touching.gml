/// @description scr_plr_ladder_is_grabbing(o_player)
/// @param o_player
	
if (argument0.v_plr_input_y == -1) && (place_meeting(argument0.x, argument0.y, o_ladder))
{
	argument0.v_plr_ladder_grab = true;
	return true;
}else
{
	argument0.v_plr_ladder_grab = false;
	return false;
}