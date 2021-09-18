/// @description scr_state_air_up_run(actor_id)
function scr_state_air_run() {

	/// @param o_actor

	var ID = argument[0];
	var state = ID.v_act_state_cur;
	
	scr_act_calcairvals(ID);
	if (ID.v_act_vel_x > 0) ID.v_act_faceright = true;
	if (ID.v_act_vel_x < 0) ID.v_act_faceright = false;

	if (state.v_state_sprite != undefined && ID.v_act_faceright) ID.sprite_index = state.v_state_sprite;
	if (state.v_state_sprite_left != undefined && !ID.v_act_faceright) ID.sprite_index = state.v_state_sprite_left;

	if (ID.v_act_vel_y >= 0) {
		if (state.v_state_air_spritedn != undefined && ID.v_act_faceright) ID.sprite_index = state.v_state_air_spritedn;
		if (state.v_state_air_spritedn_left != undefined && !ID.v_act_faceright) ID.sprite_index = state.v_state_air_spritedn_left;
	}

	// wall slide sprite
	//var slide = false;
	if (state.v_state_air_sprite_slide != undefined && state.v_state_air_sprite_slide_left != undefined) {
		var slide_y = ID.y - 15;
		with (ID) {
			if (place_meeting(x - 1, y, o_wall) && v_act_actcon.v_actcon_left) {
				//slide = true;
				ID.sprite_index = state.v_state_air_sprite_slide;
				state.v_state_count--;
				if (state.v_state_count <= 0)  {
					instance_create_layer(bbox_left, slide_y, "Hitboxes", o_fx_smoke);
					state.v_state_count = state.v_state_count_max;
				}
			}
			if (place_meeting(x + 1, y, o_wall) && v_act_actcon.v_actcon_right) {
				//slide = true;
				ID.sprite_index = state.v_state_air_sprite_slide_left;
				state.v_state_count--;
				if (state.v_state_count <= 0)  {
					instance_create_layer(bbox_right, slide_y, "Hitboxes", o_fx_smoke);
					state.v_state_count = state.v_state_count_max;
				}
			}
		}
	}



}
