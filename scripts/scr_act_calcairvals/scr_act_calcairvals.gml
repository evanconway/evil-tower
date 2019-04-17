/// @description scr_act_calcairvals(o_actor, grv, xacc)
/// @param actor_id
/// @param gravity
/// @param xacceleration

var ID = argument[0];
var grv = argument[1];
var xacc = argument[2];

// determine y velocity
if (ID.v_act_vel_y < ID.v_act_vel_y_max) ID.v_act_vel_y += grv;
ID.v_act_vel_y = scr_obj_approachdist_y_at_x_against_obj(ID, ID.v_act_vel_y, ID.x, o_wall);

// determine x velocity

if (ID.v_act_actcon.v_actcon_right && !ID.v_act_actcon.v_actcon_left && ID.v_act_vel_x < ID.v_act_vel_x_max) {
	ID.v_act_vel_x += xacc;
	if (ID.v_act_vel_x > ID.v_act_vel_x_max) ID.v_act_vel_x = ID.v_act_vel_x_max;
}
if (!ID.v_act_actcon.v_actcon_right && ID.v_act_actcon.v_actcon_left && ID.v_act_vel_x > ID.v_act_vel_x_max * -1) {
	ID.v_act_vel_x -= xacc;
	if (ID.v_act_vel_x < ID.v_act_vel_x_max *-1) ID.v_act_vel_x = ID.v_act_vel_x_max * -1;
}

// X deceleration
if (!ID.v_act_actcon.v_actcon_right && !ID.v_act_actcon.v_actcon_left && ID.v_act_vel_x != 0) {
	if (place_meeting(ID.x, scr_act_potypos(ID, ID.v_act_vel_y) + 1, o_wall)) ID.v_act_vel_x = 0;
	if (ID.v_act_vel_x > 0) {
		ID.v_act_vel_x -= xacc;
		if (ID.v_act_vel_x < 0) ID.v_act_vel_x = 0;
	} else {
		ID.v_act_vel_x += xacc;
		if (ID.v_act_vel_x > 0) ID.v_act_vel_x = 0;
	}
}
ID.v_act_vel_x = scr_obj_approachdist_x_at_y_against_obj(ID, ID.v_act_vel_x, scr_act_potypos(ID, ID.v_act_vel_y), o_wall);
