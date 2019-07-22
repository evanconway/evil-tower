/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(1);
draw_self();
draw_set_color(c_red);
if (global.bboxs_visible) draw_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_top, true);