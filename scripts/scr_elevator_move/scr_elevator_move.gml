/// @description scr_elevator_move(elevator, velocity)

/// @param elevator
/// @param velocity

if (argument[0].y != argument[0].v_elevator_end_y)
{
	if (argument[1] <= 0)//if true: elevator is going down
	{
		if (scr_act_potypos(argument[0], argument[1]) >= argument[0].v_elevator_end_y) argument[0].v_act_vel_y = argument[1];
		else argument[0].v_act_vel_y = argument[0].v_elevator_end_y - y;
	} else {
		if (scr_act_potypos(argument[0], argument[1]) <= argument[0].v_elevator_end_y) argument[0].v_act_vel_y = argument[1];
		else argument[0].v_act_vel_y = argument[0].v_elevator_end_y - y;
	}
}