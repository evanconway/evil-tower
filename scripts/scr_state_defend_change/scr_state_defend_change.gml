/// @description scr_state_defend_change(o_actor)
/// @param actor_id

var ID = argument[0];

ID.v_act_state_cur.v_state_defend_continue = true;

if (ID.v_act_actcon.v_actcon_right && !ID.v_act_actcon.v_actcon_left) ID.v_act_faceright = true;
if (!ID.v_act_actcon.v_actcon_right && ID.v_act_actcon.v_actcon_left) ID.v_act_faceright = false;
scr_state_changesprite(ID);
scr_playsfx(snd_thudlight);
ID.v_act_state_cur.v_state_defend_blockID = instance_create_layer(ID.x, ID.y, "Hitboxes", ID.v_act_state_cur.v_state_defend_block);
ID.v_act_state_cur.v_state_defend_blockID.v_block_blocker = ID;
ID.v_act_state_cur.v_state_defend_blockID.v_block_state = ID.v_act_state_cur;
