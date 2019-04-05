/// @description 
v_hitbox_hitter = undefined; // the actor creating this hitbox, some areas reference this
v_hitbox_target = undefined; // a parent object.
v_hitbox_time = 25;
v_hitbox_permenant = false;
v_hitbox_damage = 1;
v_hitbox_stun = 60; // frames of freeze time hitter and target experience when hitbox connects
v_hitbox_freezehitter = false;;
v_hitbox_effect = o_fx_smack;
v_hitbox_snd_miss = undefined;
v_hitbox_snd_hit = undefined;
v_hitbox_firstcheck = true;

/*
We were going to create variables for things like hitbox width and height, but 
there doesn't seem to be an easy way to code hitbox data. It's easier to just
make a sprite with the correct dimensions (don't forget to set the correct
sprite origin).
*/
