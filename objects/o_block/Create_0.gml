/// @description 

v_block_target = undefined; // hitbox this block stops
v_block_blocker = undefined; // actor using block
v_block_state = undefined; // to check if actor is still blocking
v_block_drawsprite = false; 
v_block_hitboxesblocked = ds_list_create();
v_block_fx = o_fx_block;
v_block_sound = snd_knock;
v_block_shake = 1; // set 0 for no shake on block