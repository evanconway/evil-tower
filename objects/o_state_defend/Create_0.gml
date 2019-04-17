event_inherited();

v_state_script_continue = scr_state_defend_continue;
v_state_script_connect = scr_state_defend_connect;
v_state_script_change = scr_state_defend_change;
v_state_script_run = scr_state_defend_run;

v_state_defend_offset_x = 18; // changes hitbox position, arbitrary numbers to get us started
v_state_defend_offset_y = -17;
v_state_defend_block = o_block;
v_state_defend_blockID = undefined;
v_state_defend_continue = true;

v_state_defend_time = 0; // gets set by hitboxes when blocking
