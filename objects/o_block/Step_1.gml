/// @description Delete if not blocking

if (v_block_blocker == undefined) instance_destroy(id); 
else {
	
	if (!instance_exists(v_block_blocker)) {
		instance_destroy(id);
		exit;
	}
	
	if (v_block_state == undefined) {
		instance_destroy(id);
		exit;
	}
	
	if (v_block_blocker.v_act_state_cur != v_block_state) {
		instance_destroy(id);
		exit;
	}
	
	// removed hitboxes that no longer exist
	for (var i = 0; i < ds_list_size(v_block_hitboxesblocked); i++) {
		if (!instance_exists(v_block_hitboxesblocked[|i])) {
			ds_list_delete(v_block_hitboxesblocked, i);
			i--;
		}
	}
}

/*
We may change our minds later, but for now we want
to delete bocks if there is not a blocker associated with them.
This means we'll have to associate a blocker with the block on
instance creation since the default value is undefined.
*/
