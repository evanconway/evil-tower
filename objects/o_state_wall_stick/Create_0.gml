event_inherited();
v_state_name = "wall_stick";

/*
The wallstick is the first state of the wall jump action. If the actor is in the air,
is pressing left or right in the direction of an o_wall, that wall is within 
wallstick_dist, pressed jump, and the actor has not jumped off that wall yet while in 
air, the actor can enter this state. 
*/

v_state_count_max = 10;// original in player is 14
v_state_count = v_state_count_max;

/*
To make wall jumping less frustrating, we check a distance away from the wall, if the
actor is within that distance from the wall, they are automatically moved to the wall.
It just kinda feels right to do it this way.
*/
v_state_wall_stick_dist = 1; // original in player is 7
v_state_wall_stick_sign = 1; // 1 for stick right wall, -1 for stick left

/*
These must be false for actor to stick to wall. L or R is for wall relative to
player. So if Lwall is false, player can stick to the wall to their left. If 
Rwall is true, player cannot stick to wall to their right. These are reset
when touching the ground, or after jumping off the opposite wall.
*/
v_state_wall_stick_Lwall = false;
v_state_wall_stick_Rwall = false;

v_state_script_continue = scr_state_iscounting;
v_state_script_connect = scr_state_wall_stick_connect;
v_state_script_change = scr_state_wall_stick_change;
v_state_script_run = scr_state_wall_stick_run;
v_state_script_altrun = scr_state_wall_stick_altrun;
v_state_script_continue_postrun = scr_state_returntrue;
