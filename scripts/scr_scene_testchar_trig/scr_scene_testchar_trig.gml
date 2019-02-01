/// @description scr_scene_testchar_trig(args)

/// @param(args)

var ID = ds_list_find_value(argument[0], 0);

var result = false;
var playerXset = 15;

if (scr_input_check(true, enum_input.up) &&
	place_meeting(ID.x, ID.y, o_player) &&
	o_player.v_plr_state == enum_plr_state.gnd_idle) {
	result = true;
	if (o_player.x < ID.x) o_player.x = ID.x - playerXset;
	else o_player.x = ID.x + playerXset;
}
return result;