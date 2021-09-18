///string_controllercheck(kinput);
function scr_string_controllercheck(argument0) {

	//Checks the given controller button and returns it as a string.

	var result = global.novalue;

	// buttons

	//face 1
	if argument0 == (gp_face1)
	{
	    result = "Button 1";
	}

	//face 2
	if argument0 == (gp_face2)
	{
	    result = "Button 2";
	}

	//face 3
	if argument0 == (gp_face3)
	{
	    result = "Button 3";
	}

	//face 4
	if argument0 == (gp_face4)
	{
	    result = "Button 4";
	}

	//dpad up
	if argument0 == (gp_padu)
	{
	    result = "D Pad Up";
	}

	//dpad down
	if argument0 == (gp_padd)
	{
	    result = "D Pad Down";
	}

	//dpad left
	if argument0 == (gp_padl)
	{
	    result = "D Pad Left";
	}

	//dpad right
	if argument0 == (gp_padr)
	{
	    result = "D Pad Right";
	}

	//shoulderl
	if argument0 == (gp_shoulderl)//Apparently shoulderl is actually the bumper, and shoulderlb is the trigger. Stupid syntax design.
	{
	    result = "Left Bumper";
	}

	//shoulderr
	if argument0 == (gp_shoulderr)
	{
	    result = "Right Bumper";
	}

	//left click
	if argument0 == (gp_stickl)
	{
	    result = "Left Stick Click";
	}

	//Right Click
	if argument0 == (gp_stickr)
	{
	    result = "Right Stick Click";
	}

	//start
	if argument0 == (gp_start)
	{
	    result = "Start";
	}

	//select
	if argument0 == (gp_select)
	{
	    result = "Select";
	}


	//axis inputs

	//Trigger Left
	if argument0 == (enum_axis.trigger_left)
	{
	    result = "Trigger Left";
	}

	//Trigger Right
	if argument0 == (enum_axis.trigger_right)
	{
	    result = "Trigger Right";
	}

	//left up
	if argument0 == (enum_axis.left_up)
	{
	    result = "Left Stick Up";
	}

	//left down
	if argument0 == (enum_axis.left_down)
	{
	    result = "Left Stick Down";
	}

	//left left
	if argument0 == (enum_axis.left_left)
	{
	    result = "Left Stick Left";
	}

	//left right
	if argument0 == (enum_axis.left_right)
	{
	    result = "Left Stick Right";
	}

	//right up
	if argument0 == (enum_axis.right_up)
	{
	    result = "Right Stick Up";
	}

	//right down
	if argument0 == (enum_axis.right_down)
	{
	    result = "Right Stick Down";
	}

	//right left
	if argument0 == (enum_axis.right_left)
	{
	    result = "Right Stick Left";
	}

	//right right
	if argument0 == (enum_axis.right_right)
	{
	    result = "Right Stick Right";
	}

	return result;




}
