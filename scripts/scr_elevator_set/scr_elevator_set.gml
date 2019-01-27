/// @description scr_elevator_set(elevator, type, target_room)

/// @param elevator
/// @param type
/// @param target_room

// target elevator and room are only used for lvl_end

argument[0].v_elevator_type = argument[1];

switch(argument[1])
{
	case enum_elevator_type.lvl_start:
	global.elevator_active = true;
	o_player.depth = argument[0].v_elevator_plrdepth_adj;
	argument[0].image_speed = 0;
	argument[0].image_index = sprite_get_number(s_elevator) - 1;
	argument[0].v_elevator_end_y = argument[0].y;
	argument[0].y += argument[0].v_elevator_start_y;
	scr_act_resetyinputstart(id);
	scr_plr_setstate(o_player, enum_plr_state.elevator);
	argument[0].v_elevator_playerentered = true;
	o_player.x = x;
	o_player.sprite_index = s_plr_gnd_static;
	o_camera.x = o_player.x;
	o_camera.y = o_player.y;
	o_camera.v_camera_follow = global.novalue;
	break;
	case enum_elevator_type.lvl_end:
	argument[0].v_elevator_timer = argument[0].v_elevator_liftdelay;
	argument[0].image_speed = 0;
	argument[0].image_index = 0;
	argument[0].v_elevator_end_y += argument[0].y;
	argument[0].v_elevator_canenter = true;
	argument[0].v_elevator_target_room = argument[2];
	break;
	case enum_elevator_type.move:
	argument[0].image_speed = 0;
	argument[0].image_index = 0;
	break;
}
