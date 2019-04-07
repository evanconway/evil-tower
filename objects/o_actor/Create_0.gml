/// @description Declare Actor Variables

// Old variables we may remove when actors have been reworked
v_act_health = 3;
v_act_state_beforehit = 0;
v_act_stuntime = 0;

//movement
v_act_vel_x_max = 1;
v_act_vel_y_max = 1;
v_act_vel_x_acc = 0.15;
v_act_vel_y_acc = 0.15;
v_act_vel_runaccel = v_act_vel_x_max;
v_act_jumppwr = -1;//jump power
v_act_grv = 0.1;//gravity
v_act_hurtjump = -1
v_act_vel_airxaccel = 0.1;
v_act_input_x = 0;//horizontal movement input (-1 = left, 1 = right, 0 = none)
v_act_input_y = 0;//vertical movement input (-1 = up, 1 = down, 0 = none)
v_act_input_x_prev = 0;
v_act_input_y_prev = 0;

v_act_explosion_y_offset = 0;

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
v_act_controller = instance_create_layer(x, y, "Enemies", o_actor_controller);
v_act_state_cur= undefined; // assign after all states are made
v_act_state_default = undefined;
v_act_sprite_change = false; // set to true on frame sprite_index changes
v_act_sprite_prev = sprite_index; // used to check against current sprite_index
v_act_image_change = false; // set to true on frame image_index changes
v_act_image_prev = image_index; // used to check against current image_index
v_act_inputlocktime_max = 0;
v_act_inputlocktime = v_act_inputlocktime_max;
v_act_freezetime = 0;

/*
The hurt state is an interesting state. It will connect to other states, but other 
states will not connect to it. Hitboxes from other actors will set an actor to 
this state. 
*/
v_act_state_hurt = undefined;
v_act_hurt_fx = undefined;
v_act_hurt_fx_yoffset = 0;

/*
Some actors will need special things to happen when they die, like the player 
and bosses. Normal enemies just need a cool explosion.
*/
v_act_dead_scene = undefined;
v_act_dead_fx = undefined;

/*
To allow actors to hurt other actors just by running into them, we are giving 
actors a hitbox that will move with them.
*/
v_act_hitbox = undefined;

// the following are old variables that we are 100% going to continue using
v_act_bbox_color = c_lime;
v_act_vel_x = 0;//variable_player_speed_horizontal
v_act_vel_y = 0;//vertical
v_act_input_x_start = x;
v_act_input_y_start = y;
v_act_xmovedist = 0;
v_act_ymovedist = 0;
v_act_faceright = true;
v_act_faceright_prev = v_act_faceright;
v_act_hitboxes_struck = ds_list_create();

// if an actor is in the enemies_slain list, get rid of it
if (ds_list_find_index(global.enemies_slain, id) >= 0) instance_destroy(id);
