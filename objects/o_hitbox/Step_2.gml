/// @description Detect Collisions With Target

// if the hitter was defined, but doesn't exist, then the hitbox shouldn't exist
if (v_hitbox_hitter != undefined && !instance_exists(v_hitbox_hitter)) {
	instance_destroy(id);
	exit;
}

// generally we won't set the hitterstate if the hitbox is permenant
if (v_hitbox_hitterstate != undefined && v_hitbox_hitter.v_act_state_cur != v_hitbox_hitterstate) {
	instance_destroy(id); // we keep track of attack state of hitter, if they abruptly leave it, delete hitbox
	exit;
}

if (v_hitbox_wallends && place_meeting(x, y, o_wall)) {
	if (v_hitbox_fx != undefined) instance_create_layer(x, y, "Hitboxes", v_hitbox_fx);
	if (v_hitbox_snd_hit != undefined) scr_playsfx_toplayer(x, y, v_hitbox_snd_hit);
	instance_destroy(id);
	exit;
}

/*
Two lists are made for hitboxes each frame, block hits and target hits. Both lists are of actors.
An actor is placed in the block list if:

hitbox collides with block and not target
hitbox collides with block and target, and block and target are on same side of hitter
hitbox collides with block and target, hitter is undefined and block and target are on same side of hitter

In all cases, the actor is not added to the list if the hitbox is already in the hitboxes_struck 
list of the block, or the block doesn't have the hitbox as their target

An actor is placed in the targets list if:

hitbox collides with target and not block
hitbox collides with target and block, and target is not already in blocks list

In all cases the actor is not added to the list if the hitbox is already in the hitboxes_struck
list of the actor.
*/

// first make list of all blocks colliding with hitbox
var blocks = ds_list_create();
instance_place_list(x, y, o_block, blocks, false);

// remove all blocks from the list that don't target this hitbox
for (var i = 0; i < ds_list_size(blocks); i++) {
	if (blocks[|i].v_block_target != object_index && !object_is_ancestor(object_index, blocks[|i].v_block_target)) {
		ds_list_delete(blocks, i);
		i--;
	}
}
// remove all blocks where the blocker is not a target of this hitbox
for (var i = 0; i < ds_list_size(blocks); i++) {
	if (blocks[|i].v_block_blocker.object_index != v_hitbox_target) {
		ds_list_delete(blocks, i);
		i--;
	}
}
// remove all blocks from list that already contain this hitbox
// note we need another list to keep track of targets removed this way
// and this list is of actors, not instances of o_block
var targets_still_blocking = ds_list_create();
for (var i = 0; i < ds_list_size(blocks); i++) {
	if (ds_list_find_index(blocks[|i].v_block_hitboxesblocked, id) >= 0) {
		ds_list_add(targets_still_blocking, blocks[|i].v_block_blocker);
		ds_list_delete(blocks, i);
		i--;
	}
}
// if hitter is defined, remove blocks that don't match our criteria
if (v_hitbox_hitter != undefined) {
	for (var i = 0; i < ds_list_size(blocks); i++) {
		var blockx = blocks[|i].x;
		var targetx = blocks[|i].v_block_blocker.x
		var deleteblock = true;
		// assume delete the block unless blocking criteria are met
		// don't delete if target is to the left of hitter and block
		if (targetx <= blockx && targetx <= v_hitbox_hitter.x) deleteblock = false;
		// don't delete if target is to the right of hitter and block
		if (targetx >= blockx && targetx >= v_hitbox_hitter.x) deleteblock = false;
		if (deleteblock) {
			ds_list_delete(blocks, i);
			i--;
		}
	}
} else {
	// if hitter is not defined, same process but using hitbox instead of hitter
	for (var i = 0; i < ds_list_size(blocks); i++) {
		var blockx = blocks[|i].x;
		var targetx = blocks[|i].v_block_blocker.x
		var deleteblock = false;
		if (x < blockx && targetx < blockx) deleteblock = true;
		if (x > blockx && targetx > blockx) deleteblock = true;
		if (deleteblock) {
			ds_list_delete(blocks, i);
			i--;
		}
	}
}

// now we will make a list of all valid target collisions using a similar process
var targets = ds_list_create();
instance_place_list(x, y, v_hitbox_target, targets, false);

// remove all targets that have 0 or less health
for (var i = 0; i < ds_list_size(targets); i++) {
	if (targets[|i].v_act_state_hurt.v_state_hurt_health <= 0) {
		ds_list_delete(targets, i);
		i--;
	}
}

// remove all targets that already contain this hitbox
for (var i = 0; i < ds_list_size(targets); i++) {
	if (ds_list_find_index(targets[|i].v_act_hitboxes_struck, id) >= 0) {
		ds_list_delete(targets, i);
		i--;
	}
}

// remove all targets that are currently invulnerable
for (var i = 0; i < ds_list_size(targets); i++) {
	if (targets[|i].v_act_invultime > 0 || targets[|i]. v_act_invulnerable) {
		ds_list_delete(targets, i);
		i--;
	}
}

/*
Now we need to remove any targets that are blocking correctly. However...
we have already done this with the blocks list. So all we need to do is 
remove any targets that are already in the blocks list.
*/
for (var i = 0; i < ds_list_size(targets); i++) {
	for (var k = 0; k < ds_list_size(blocks); k++) {
		if (blocks[|k].v_block_blocker == targets[|i]) {
			k = ds_list_size(blocks);
			ds_list_delete(targets, i);
			i--;
		}
	}
}
// do the same for our list of targets that are still blocking
for (var i = 0; i < ds_list_size(targets); i++) {
	for (var k = 0; k < ds_list_size(targets_still_blocking); k++) {
		if (targets_still_blocking[|k] == targets[|i]) {
			k = ds_list_size(targets_still_blocking);
			ds_list_delete(targets, i);
			i--;
		}
	}
}

// we now have our two lists of blocks and targets

if (ds_list_size(blocks) != 0 || ds_list_size(targets) != 0) {
	if (v_hitbox_snd_missID != undefined) audio_stop_sound(v_hitbox_snd_missID);
}

// apply knockback to blockers
for (var i = 0; i < ds_list_size(blocks); i++) {
	var block = blocks[|i];
	var actor = block.v_block_blocker;
	var state = actor.v_act_state_cur;
	ds_list_add(block.v_block_hitboxesblocked, id);
	if (v_hitbox_stun > actor.v_act_freezetime) actor.v_act_freezetime = v_hitbox_stun * 0.5;
	if (v_hitbox_stun > state.v_state_defend_time) state.v_state_defend_time = v_hitbox_stun;
	if (v_hitbox_freezehitter && v_hitbox_hitter!= undefined && instance_exists(v_hitbox_hitter)) {
		v_hitbox_hitter.v_act_freezetime = v_hitbox_stun * 0.5; // less stun on block
	}
	if (block.v_block_fx != undefined) instance_create_layer(block.x, block.y, "Projectiles", block.v_block_fx);
	if (block.v_block_sound != undefined) scr_playsfx_toplayer(block.x, block.y, block.v_block_sound);
	if (v_hitbox_hitter != undefined) {
		if (v_hitbox_hitter.x < actor.x) actor.v_act_vel_x = v_hitbox_knock_x;
		if (v_hitbox_hitter.x > actor.x) actor.v_act_vel_x = v_hitbox_knock_x * -1;
	} else {
		if (x < actor.x) actor.v_act_vel_x = v_hitbox_knock_x;
		if (x > actor.x) actor.v_act_vel_x = v_hitbox_knock_x * -1;
	}
	actor.v_act_vel_y = v_hitbox_knock_y;
	if (block.v_block_shake != 0) {
		scr_camera_shake(actor.v_act_vel_x * block.v_block_shake, 0);
	}
	if (v_hitbox_destroyonhit) instance_destroy(id);
}

// apply hit effects to targets
for (var i = 0; i < ds_list_size(targets); i++) {
	var actor = targets[|i];
	ds_list_add(actor.v_act_hitboxes_struck, id);
	var hurt = actor.v_act_state_hurt;
	hurt.v_state_hurt_health -= v_hitbox_damage;
	
	if (v_hitbox_freezegame) global.freezeactors_time = v_hitbox_stun;
	else if (v_hitbox_freezehitter && instance_exists(v_hitbox_hitter)) v_hitbox_hitter.v_act_freezetime = v_hitbox_stun;
	if (v_hitbox_fx != undefined) instance_create_layer(actor.x, actor.y - hurt.v_state_hurt_fx_yoffset, "Projectiles", v_hitbox_fx);
	if (v_hitbox_snd_hit != undefined) scr_playsfx_toplayer(x, y, v_hitbox_snd_hit);	
	
	if (hurt.v_state_hurt_health > 0) {
		if (!v_hitbox_freezegame) actor.v_act_freezetime = v_hitbox_stun;
		actor.v_act_shadertime = v_hitbox_stun;
		actor.v_act_shader = v_hitbox_shader;
		hurt.v_state_count = hurt.v_state_count_max;
		if (hurt.v_state_hurt_fx != undefined) instance_create_layer(actor.x, actor.y - hurt.v_state_hurt_fx_yoffset, "Projectiles", hurt.v_state_hurt_fx);
		if (hurt.v_state_hurt_snd != undefined) scr_playsfx_toplayer(actor.x, actor.y, hurt.v_state_hurt_snd);
				
		if (actor.v_act_state_cur != undefined && object_is_ancestor(actor.v_act_state_cur.object_index, o_state_ladder)) {
			hurt.v_state_hurt_ladder = true;
			hurt.v_state_hurt_vel_x = 0;
			hurt.v_state_hurt_vel_y = 0;
		} else {
			hurt.v_state_hurt_ladder = false;
			if (v_hitbox_hitter != undefined) {
				if (v_hitbox_hitter.x < actor.x) hurt.v_state_hurt_vel_x = v_hitbox_knock_x;
				if (v_hitbox_hitter.x > actor.x) hurt.v_state_hurt_vel_x = v_hitbox_knock_x * -1;
			} else {
				if (x < actor.x) hurt.v_state_hurt_vel_x = v_hitbox_knock_x;
				if (x > actor.x) hurt.v_state_hurt_vel_x = v_hitbox_knock_x * -1;
			}
			hurt.v_state_hurt_vel_y = v_hitbox_knock_y;
		}
		if (v_hitbox_shake_hit != 0) {
			scr_camera_shake(hurt.v_state_hurt_vel_x * v_hitbox_shake_hit, 0);
		}
		if (v_hitbox_destroyonhit) instance_destroy(id);
		actor.v_act_state_cur = hurt;
	} else {
		if (v_hitbox_shake_kill != 0) {
			var c_shake_x = 0;
			if (v_hitbox_hitter != undefined) {
				if (v_hitbox_hitter.x < actor.x) c_shake_x = v_hitbox_knock_x;
				if (v_hitbox_hitter.x > actor.x) c_shake_x = v_hitbox_knock_x * -1;
			} else {
				if (x < actor.x) c_shake_x = v_hitbox_knock_x;
				if (x > actor.x) c_shake_x = v_hitbox_knock_x * -1;
			}
			scr_camera_shake(c_shake_x * v_hitbox_shake_kill, 0);
		}
		scr_act_kill(actor);
	}
}

if (v_hitbox_firstcheck && ds_list_size(blocks) == 0 && ds_list_size(targets) == 0) {
	v_hitbox_snd_missID =  scr_playsfx_toplayer(x, y, v_hitbox_snd_miss);
}

v_hitbox_firstcheck = false;

ds_list_destroy(blocks);
ds_list_destroy(targets);
ds_list_destroy(targets_still_blocking);
