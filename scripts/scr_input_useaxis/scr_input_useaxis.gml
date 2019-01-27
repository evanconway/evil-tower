/// @description s_input_useaxis(input)
/// @param input

var result = false;

if (argument[0] == enum_axis.trigger_left) result = true;
if (argument[0] == enum_axis.trigger_right) result = true;
if (argument[0] == enum_axis.left_left) result = true;
if (argument[0] == enum_axis.left_right) result = true;
if (argument[0] == enum_axis.left_up) result = true;
if (argument[0] == enum_axis.left_down) result = true;
if (argument[0] == enum_axis.right_left) result = true;
if (argument[0] == enum_axis.right_right) result = true;
if (argument[0] == enum_axis.right_up) result = true;
if (argument[0] == enum_axis.right_down) result = true;


return result;