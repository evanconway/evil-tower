/// @description scr_state_ladder_down_change(o_actor)

/// @param actor_id

var ID = argument[0];
var state = ID.v_act_state_cur;

if (ID.sprite_index != state.v_state_sprite) scr_state_changesprite(ID);

// since actors can climb down ladders beneath them, we have to set velocities for that
if (!place_meeting(ID.x, ID.y, o_ladder)) state.v_state_ladder_down_stepdown = true;
