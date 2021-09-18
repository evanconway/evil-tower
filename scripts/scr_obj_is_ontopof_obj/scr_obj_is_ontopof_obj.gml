/// @description scr_obj_is_ontopof_obj(obja, objb)
/// @param obja
///@param objb
function scr_obj_is_ontopof_obj(argument0, argument1) {

	if (place_meeting(argument0.x, argument0.y + 1, argument1))
	{
		return true;
	} else
	{
		return false; 
	}


}
