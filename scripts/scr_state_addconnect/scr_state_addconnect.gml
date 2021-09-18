/// @description scr_state_addconnect(o_state, o_state)
function scr_state_addconnect() {

	/// @param state_getting_connect
	/// @param state_connectingto

	ds_list_add(argument[0].v_state_connections, argument[1]);



}
