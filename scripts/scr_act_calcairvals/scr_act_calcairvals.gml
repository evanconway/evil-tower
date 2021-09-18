/// @description scr_act_calcairvals(o_actor)
/// @param actor_id
function scr_act_calcairvals() {

	var ID = argument[0];
	var grv = ID.v_act_grv;
	var xacc = ID.v_act_airxacc;

	/*
	with our current movement system, a velocity can never go from positive to negative
	or negative to positive without first becoming 0. 
	*/

	var velyisnegative = false;
	if (ID.v_act_vel_y < 0) velyisnegative = true;

	// determine y velocity
	if (ID.v_act_canfastfall && ID.v_act_vel_y >= 0 && ID.v_act_actcon.v_actcon_pressed_down) {
		ID.v_act_vel_y = ID.v_act_vel_y_max;
	}
	if (ID.v_act_vel_y < ID.v_act_vel_y_max) ID.v_act_vel_y += grv;
	// after adding gravity, we check to see if velocity switched from negative to positive
	if (ID.v_act_vel_y > 0 && velyisnegative) ID.v_act_vel_y = 0;
	ID.v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(ID, ID.v_act_vel_y, ID.x, o_wall);

	// determine x velocity
	// remember we must check for switch between pos and neg here as well
	var velxisnegative = false;
	if (ID.v_act_vel_x < 0) velxisnegative = true;
	if (ID.v_act_actcon.v_actcon_right && !ID.v_act_actcon.v_actcon_left && ID.v_act_vel_x < ID.v_act_vel_x_max) {
		ID.v_act_vel_x += xacc;
		if (ID.v_act_vel_x > 0 && velxisnegative) ID.v_act_vel_x = 0;
		if (ID.v_act_vel_x > ID.v_act_vel_x_max) ID.v_act_vel_x = ID.v_act_vel_x_max;
	}
	var velxispositive = false;
	if (ID.v_act_vel_x > 0) velxispositive = true;
	if (!ID.v_act_actcon.v_actcon_right && ID.v_act_actcon.v_actcon_left && ID.v_act_vel_x > ID.v_act_vel_x_max * -1) {
		ID.v_act_vel_x -= xacc;
		if (ID.v_act_vel_x < 0 && velxispositive) ID.v_act_vel_x = 0;
		if (ID.v_act_vel_x < ID.v_act_vel_x_max *-1) ID.v_act_vel_x = ID.v_act_vel_x_max * -1;
	}

	// X deceleration
	if (!ID.v_act_actcon.v_actcon_right && !ID.v_act_actcon.v_actcon_left && ID.v_act_vel_x != 0) {
		if (place_meeting(ID.x, scr_act_potypos(ID, ID.v_act_vel_y) + 1, o_wall)) ID.v_act_vel_x = 0;
		if (ID.v_act_vel_x > 0) {
			ID.v_act_vel_x -= xacc;
			if (ID.v_act_vel_x < 0) ID.v_act_vel_x = 0;
		}
		if (ID.v_act_vel_x < 0) {
			ID.v_act_vel_x += xacc;
			if (ID.v_act_vel_x > 0) ID.v_act_vel_x = 0;
		}
	}

	var checky = scr_act_potypos(ID, ID.v_act_vel_y);

	ID.v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(ID, ID.v_act_vel_x, checky, o_wall);



}
