/// @description Declare Actor Variables
/*
I need to make a note to myself here. This actor rework is going to change a lot.
All new variables will be listed here, and may not be well organized. A bunch 
of variables above need to go to the chopping block at some point. Not sure
how to organize when or how to go about that.

Something to note as that a lot of actor variables are only used for specific states.
Stun time is a good example, only used during hurt state. Even the velocities are 
kind of state dependent. We may remove most of these in favor of storing them
in the state objects. So if you want to know the walking speed of an actor, you
look at their walking state, not the actor.
*/
v_act_ai = undefined;
v_act_actcon = instance_create_layer(x, y, "Enemies", o_actcon);
v_act_state_cur= undefined; // assign after all states are made
v_act_state_default = undefined;
v_act_sprite_change = false; // set to true on frame sprite_index changes
v_act_sprite_prev = sprite_index; // used to check against current sprite_index
v_act_image_change = false; // set to true on frame image_index changes
v_act_image_prev = image_index; // used to check against current image_index
v_act_inputlocktime_max = 0;
v_act_inputlocktime = v_act_inputlocktime_max;
v_act_freezetime = 0;
v_act_shadertime = 0;
v_act_shader = undefined;
v_act_alpha = 1;
v_act_disableActcon = false;

/*
The hurt state is an interesting state. It will connect to other states, but other 
states will not connect to it. Hitboxes from other actors will set an actor to 
this state. 
*/
v_act_state_hurt = undefined;

/*
To allow actors to hurt other actors just by running into them, we are giving 
actors a hitbox that will move with them.
*/
v_act_hitbox = undefined;

// the following are old variables that we are 100% going to continue using
v_act_bbox_color = c_lime;
v_act_vel_x = 0;
v_act_vel_y = 0;
v_act_vel_x_max = 3;
v_act_vel_y_max = 3;
v_act_grv = 0.15;
v_act_airxacc = 0.15;
v_act_jump = -3;
v_act_canfastfall = true;
v_act_input_x_start = x;
v_act_input_y_start = y;
v_act_xmovedist = 0;
v_act_ymovedist = 0;
v_act_faceright = true;
v_act_faceright_prev = v_act_faceright;
v_act_hitboxes_struck = ds_list_create();

// if an actor is in the enemies_slain list, get rid of it
if (ds_list_find_index(global.enemies_slain, id) >= 0) {
	instance_destroy(id);
}
