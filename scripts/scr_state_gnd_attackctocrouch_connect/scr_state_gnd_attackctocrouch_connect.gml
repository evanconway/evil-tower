/// @description scr_state_gnd_attackctocrouch_connect(o_actor)
/// @param actor_id

var ID = argument[0];
var actcon = ID.v_act_controller;
var result = false;

if (actcon.v_actcon_down) result = true;
if (actcon.v_actcon_left) result = false;
if (actcon.v_actcon_right) result = false;

return result;