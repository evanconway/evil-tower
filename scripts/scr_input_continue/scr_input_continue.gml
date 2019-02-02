/// @description scr_input_continue()

var result = false;

if (scr_input_check(true, enum_input.button1)) result = true;
if (scr_input_check(true, enum_input.button2)) result = true;
if (scr_input_check(true, enum_input.button3)) result = true;
if (scr_input_check(true, enum_input.select)) result = true;
if (scr_input_check(true, enum_input.cancel)) result = true;

return result;