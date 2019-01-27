/// @description scr_plr_ladder_check_approach(o_player, o_wall, o_ladder, movey)
/// @param o_player
/// @param o_wall
/// @param o_ladder
/// @param movey

var collision_yboundplusmove = 0;

if (argument3 > 0)
{
	if (abs(argument3) < 1) collision_yboundplusmove = argument0.bbox_bottom + sign(argument3);
	else collision_yboundplusmove = argument0.bbox_bottom + scr_act_potypos(argument0, argument3) - argument0.y;
} else
{
	if (abs(argument3) < 1) collision_yboundplusmove = argument0.bbox_top + sign(argument3);
	else collision_yboundplusmove = argument0.bbox_top + scr_act_potypos(argument0, argument3) - argument0.y;
}

var wastouchingwall = false;

if (place_meeting(argument0.x, argument0.y, o_wall)) wastouchingwall = true; 

//still going to touch ladder?
if (place_meeting(argument0.x, scr_act_potypos(argument0, argument3), argument2))
{
	//yes
	//is part of player going to be off ladder?
	if (position_meeting(argument0.x, collision_yboundplusmove, argument2)) //this might not work,
	{
		//no   
		return enum_plr_ladder_check_move.stillonladder;
	} else
	{
		//yes
		//check to see if ladder ends at wall, or empty space
		if (position_meeting(argument0.x, collision_yboundplusmove, argument1))
		{
			//ends at wall
			return enum_plr_ladder_check_move.hitwall;
		} else
		{
			return enum_plr_ladder_check_move.stillonladder;
		}
	}
} else 
{
	if (wastouchingwall) return enum_plr_ladder_check_move.nothingbutonground;
	else return enum_plr_ladder_check_move.touchingnothing;
}