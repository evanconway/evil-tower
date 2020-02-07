/// @description scr_state_ladder_fall_change(o_actor)
/// @param actor_id

var ID = argument[0];
ID.v_act_vel_x = 0;
ID.v_act_vel_y = 0;
scr_state_changesprite(ID);
