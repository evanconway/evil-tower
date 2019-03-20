event_inherited();

// actor inputlocktime is set to count_max.
v_state_count_max = 15;

/*
Wall stick is the only state that will use this state. So, once wall stick
is done counting, its continue script will stop returning true, and we can
automatically assume we'll go to this state.
*/
v_state_script_connect = scr_state_returntrue;

// sets x vel and y vel and sets actor input lock to count max
v_state_script_change = scr_state_wall_jump_change;
