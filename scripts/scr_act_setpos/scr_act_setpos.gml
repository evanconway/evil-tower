/// @description scr_act_setpos(actID, x, y) 

/// @param actID
/// @param x
/// @param y

var ID = argument[0];

ID.x = argument[1];
ID.v_act_input_x_start = argument[1];
ID.v_act_xmovedist = 0;
ID.y = argument[2]
ID.v_act_input_y_start = argument[2];
ID.v_act_ymovedist = 0;
