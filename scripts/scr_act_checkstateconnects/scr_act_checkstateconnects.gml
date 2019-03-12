/// @description scr_act_checkstatechanges(actor_id)

/// @param o_actor

var ID = argument[0];

var checkconnects = true;
if (ID.v_act_state_cur.v_state_script_continue != undefined && script_execute(ID.v_act_state_cur.v_state_script_continue, ID)) {
	checkconnects = false;
}	

if (checkconnects) {
	for (var i = 0; i < ds_list_size(ID.v_act_state_cur.v_state_connections); i++) {
		var state_connection = ds_list_find_value(ID.v_act_state_cur.v_state_connections, i);
		if (script_execute(state_connection.v_state_script_connect, ID, state_connection)) {
			i = ds_list_size(ID.v_act_state_cur.v_state_connections);
			ID.v_act_state_cur = state_connection;
			script_execute(ID.v_act_state_cur.v_state_script_change, ID);
		}
	}
}


