/// @description scr_plr_move_x(o_actor, xmove)
/// @param o_actor
/// @param xmove

var final_x_pos = 0;
var old_x_pos = argument0.v_act_input_x_start + argument0.v_act_xmovedist;
argument0.v_act_xmovedist += argument1;
var new_x_pos = argument0.v_act_input_x_start + argument0.v_act_xmovedist;
if (new_x_pos >= old_x_pos) final_x_pos = floor(new_x_pos);
else final_x_pos = ceil(new_x_pos);
argument0.x = final_x_pos;