/// @description scr_scene_testchar_trig(args)

/// @param(args)

var ID = ds_list_find_value(argument[0], 0);

var result = false;
var playerXset = 15;

var playeronground = false;
with (global.player) if (place_meeting(x, y + 1, o_wall)) playeronground = true;


if (scr_input_check(true, enum_input.up) &&
	place_meeting(ID.x, ID.y, global.player) &&
	global.player.v_act_state_cur == global.player.v_act_state_default) {
	result = true;
	if (global.player.x < ID.x) {
		scr_act_setpos(global.player.id, ID.x - playerXset, global.player.y);
		scr_act_faceright(global.player, true);
	} else { 
		scr_act_setpos(global.player.id, ID.x + playerXset, global.player.y);
		scr_act_faceright(global.player, false);
	}
}
return result;