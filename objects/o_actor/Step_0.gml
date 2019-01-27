/// @description Insert description here

if (v_act_vel_x != 0) scr_act_move_x(id, v_act_vel_x);
else scr_act_resetxinputstart(id);
if (v_act_vel_y != 0) scr_act_move_y(id, v_act_vel_y);
else scr_act_resetyinputstart(id);
