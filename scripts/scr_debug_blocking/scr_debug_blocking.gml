function scr_debug_blocking() {
	// trying to debug block boxes

	// BUG FIXED, THIS SCRIPT NO LONGER WORKS

	/*
	It's broken now because it compares the player position with the position of the block object,
	however under normal circumstances, the block object never equals the player, it's always offest
	by a specific amount.
	*/

	if (v_act_state_cur == v_plr_state_defend && v_plr_state_defend.v_state_defend_blockID != undefined) {
		var blockX = v_plr_state_defend.v_state_defend_blockID.x;
		var blockY = v_plr_state_defend.v_state_defend_blockID.y;
		var plrX = x;
		var plrY = y;
		if (blockX != plrX) {
			show_debug_message("block X mismatch");
		}
		if (blockY != plrY) {
			show_debug_message("block Y mismatch");
		}
	}


}
