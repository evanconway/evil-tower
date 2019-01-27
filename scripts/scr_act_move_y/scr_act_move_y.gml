/// @description scr_act_move_y(o_actor, ymove)
/// @param o_actor
/// @param ymove

var old_y_pos = argument0.v_act_input_y_start + argument0.v_act_ymovedist;
argument0.v_act_ymovedist += argument1;
var new_y_pos = argument0.v_act_input_y_start + argument0.v_act_ymovedist;
if (new_y_pos >= old_y_pos) argument0.y = floor(new_y_pos);
else argument0.y = ceil(new_y_pos);