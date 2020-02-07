/// @description scr_state_ladder_idle_change(o_actor)

/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

ID.v_act_vel_x = 0;
ID.v_act_vel_y = 0;

if (ID.sprite_index != state.v_state_sprite) ID.sprite_index = state.v_state_sprite;
ID.image_speed = 0;
