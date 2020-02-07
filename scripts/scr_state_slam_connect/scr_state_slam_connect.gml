/// @description scr_state_slam_connect(o_actor)
/// @param actor_id

var ID = argument[0];

var result = false;

/*
To do a slam, the actor has to jump into the air first. Pressing
the jump button again will trigger a downward slam. We return
false if the actor is on the ground because that means they are 
not in the air.
*/
if (ID.v_act_actcon.v_actcon_pressed_button1) result = true;
if (place_meeting(ID.x, ID.y, o_wall)) result = false;
if (place_meeting(ID.x, ID.y + 1, o_wall)) result = false;

return result;