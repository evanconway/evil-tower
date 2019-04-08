/// @description scr_act_kill(o_actor)
/// @param actor_id

var ID = argument[0];

if (ID.v_act_dead_fx != undefined) instance_create_layer(ID.x, ID.y, "Hitboxes", ID.v_act_dead_fx);
instance_destroy(ID);
