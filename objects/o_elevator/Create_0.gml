/// @description 

/*
The spawn elevator doesn't execute any code of its own. It only holds variables.
See the o_transition_elevator to see how it moves and acts.
*/
image_index = image_number - 1;
image_speed = 0;
v_elevator_target_y = y;
v_elevator_start_y = 200; // not start location, is added to target in transition
// remember we will have to do jank with rounding at draw to avoid problems from sub pixels
v_elevator_speed_init = 0.7;
v_elevator_speed = v_elevator_speed_init;
v_elevator_slow_y = 60; // when this dist from target, use slow speed
v_elevator_slow_rate = 0.99;
