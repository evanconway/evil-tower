/// @description scr_scene_testchar_trig(args)

/// @param(args)

var ID = ds_list_find_value(argument[0], 0);

var result = false;
var playerXset = 15;

if (scr_input_check(true, enum_input.up) &&
	place_meeting(ID.x, ID.y, global.player) &&
	global.player.v_plr_state == enum_plr_state.gnd_idle) {
	result = true;
	if (global.player.x < ID.x) scr_act_setpos(global.player.id, ID.x - playerXset, global.player.y);
	else scr_act_setpos(global.player.id, ID.x + playerXset, global.player.y);
}
return result;