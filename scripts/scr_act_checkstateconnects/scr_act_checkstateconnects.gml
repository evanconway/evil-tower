/// @description scr_act_checkstatechanges(actor_id)
function scr_act_checkstateconnects() {

	/// @param o_actor

	var ID = argument[0];

	var checkconnects = true;
	if (ID.v_act_state_cur.v_state_script_continue != undefined && script_execute(ID.v_act_state_cur.v_state_script_continue, ID)) {
		checkconnects = false;
	}	

	if (checkconnects) {
		var connect_list_size = ds_list_size(ID.v_act_state_cur.v_state_connections)
		for (var i = 0; i < connect_list_size; i++) {
			var state_connection = ds_list_find_value(ID.v_act_state_cur.v_state_connections, i);
			if (script_execute(state_connection.v_state_script_connect, ID, state_connection)) {
				i = connect_list_size;
				ID.v_act_state_cur = state_connection;
				script_execute(ID.v_act_state_cur.v_state_script_change, ID);
			}
		}
	}





}
