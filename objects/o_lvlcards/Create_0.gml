/// @description Insert description here
// You can write your code in this editor

v_lvl_introtext = instance_create_layer(global.resolution_width/2, global.resolution_height/2, "text", o_textbox);

with (v_lvl_introtext) {
	v_textbox_bodycolor = c_black;
	v_textbox_bordercolor = c_red;
	v_textbox_width_max = 80;
}