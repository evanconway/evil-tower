event_inherited();


// OLD
/*
//we detect play emy collisions here instead of in the player code
//because some emys are projectiles that die on impact
//the player code does not register emys that delete on impact
if (place_meeting(x, y, o_player)) && 
	(o_player.v_plr_invulnerabletime <= 0) && 
	(o_player.v_plr_state != enum_plr_state.dead) && 
	(o_player.v_plr_state != enum_plr_state.hurt) && 
	(o_player.v_plr_state != enum_plr_state.hurt_ladder) {
	o_player.v_plr_emyhit = true;
	o_player.v_plr_emyhitx = x;
}
*/
