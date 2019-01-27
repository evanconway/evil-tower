/// @description Insert description here

event_inherited();

v_elevator_vel = -0.7;

v_elevator_type = enum_elevator_type.lvl_end;
v_elevator_state = enum_elevator_state.entering;

v_elevator_playerentered = false;
v_elevator_playeroffset = 5;

//script must be called for these to trigger.
v_elevator_start_y = 200;//For lvl_start, how far away from starting position
v_elevator_end_y = -180;//For lvl_end, how far elevator rises after player gets in

v_elevator_target_room = 0;

v_elevator_plrdepth = o_player.depth;
v_elevator_plrdepth_adj = id.depth;

v_elevator_timer = 0; 
v_elevator_doordelay = 60;
v_elevator_liftdelay = 30;