/// @description Literally just a list of o_txt objects

// Also stores the width and height in pixels of said object. 
// Conceptually I think segments are actually words????

v_segment_txts = ds_list_create();// store o_txt

//width and height are generated from the o-txt objects stored

v_segment_width = 0;
v_segment_height = 0;

//Set true to mark beginning of new line.
v_segment_startnewline = false;
v_segment_blankline = false;

v_segment_typed = false;
v_segment_centered = false;