/// @description 

// hitbox qualities
v_hitbox_permenant = false;
v_hitbox_wallends = false;
v_hitbox_drawsprite = false;
v_hitbox_destroyonhit = false;

// hitbox physics
v_hitbox_vel_x = 0; // for projectiles
v_hitbox_vel_y = 0;
v_hitbox_grv = 0;

// hitbox fx
v_hitbox_fx = undefined;
v_hitbox_snd_hit = undefined;
v_hitbox_snd_miss = undefined;
v_hitbox_snd_missID = undefined;
v_hitbox_firstcheck = true;
v_hitbox_shader = sh_red; // shader applied for stun duration

// hitter
v_hitbox_hitter = undefined; // the actor creating this hitbox, some areas reference this
v_hitbox_hitterstate = undefined;
v_hitbox_freezehitter = true;

// aftects target
v_hitbox_target = undefined; // a parent actor this hitbox affects
v_hitbox_damage = 1;
v_hitbox_stun = 120; // frames of freeze time hitter and target experience when hitbox connects
v_hitbox_freezegame = true; // if true, entire game is frozen for duration of stun
v_hitbox_knock_x = 2;
v_hitbox_knock_y = -2;

/*
We were going to create variables for things like hitbox width and height, but 
there doesn't seem to be an easy way to code hitbox data. It's easier to just
make a sprite with the correct dimensions (don't forget to set the correct
sprite origin).
*/
