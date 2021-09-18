/// @description scr_act_checkstatechanges_postrun(actor_id)
function scr_act_checkstateconnects_postrun() {

	/// @param o_actor

	var ID = argument[0];

	var checkconnects = true;
	if (ID.v_act_state_cur.v_state_script_continue_postrun != undefined && script_execute(ID.v_act_state_cur.v_state_script_continue_postrun, ID)) {
		checkconnects = false;
	}	

	if (checkconnects) {
		for (var i = 0; i < ds_list_size(ID.v_act_state_cur.v_state_connections); i++) {
			var state_connection = ds_list_find_value(ID.v_act_state_cur.v_state_connections, i);
			if (state_connection.v_state_script_connect_postrun != undefined && script_execute(state_connection.v_state_script_connect_postrun, ID, state_connection)) {
				i = ds_list_size(ID.v_act_state_cur.v_state_connections);
				ID.v_act_state_cur = state_connection;
				script_execute(ID.v_act_state_cur.v_state_script_change_postrun, ID);
			}
		}
	}





}
