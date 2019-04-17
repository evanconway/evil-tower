/// @description scr_state_ladder_idle_run(o_actor)
/// @param actor_id

var ID = argument[0];
ID.image_speed = 0;

ID.v_act_vel_y = 0;
// match x position to ladder
if (instance_place(ID.x, ID.y, o_ladder)) {
	var ladder_x = instance_place(ID.x, ID.y, o_ladder).x;
	ID.v_act_vel_x = ladder_x - ID.x;
}

/*
Why do we need to check for image_change in a run script that sets image_speed to 0?
I'm not 100% sure... but this is what I think is happening. In the ladder_up and down states
the image speed is 1. Let's say on frame 1000, the actor was inputting up in the ladder
up state, and the image_index was something like 0.9999999999. But then on frame
1001 the actor has no inputs. The connect scripts run and determines the actor
should be in ladder_idle. But note that image speed was still 1 in between frames.
I believe this is where game maker increments image_index. So, the image index 
has probably increased to 1 at this point. And our image_change script will catch that.
But if our run script does respond to it, then we have a situation where the actor was 
climbing the ladder, the image_index changed, and there was no script to play a sound
for that. Therefore, we have to check for it here, in Idle.
*/
if (ID.v_act_image_change || ID.v_act_sprite_change) {
	scr_playsfx(snd_tick);
}
