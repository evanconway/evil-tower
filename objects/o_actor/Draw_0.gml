/// @description Insert description here
// You can write your code in this editor

if (global.actors_visible) {
	draw_set_alpha(1);
	draw_self();
}

draw_set_color(c_lime);
if (global.bboxs_visible) {
	draw_set_color(v_act_bbox_color);
	draw_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_top, true);
}