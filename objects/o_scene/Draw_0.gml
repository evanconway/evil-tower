/// @description Insert description here
// You can write your code in this editor

if (sprite_index != s_static) draw_self();

if (global.bboxs_visible) {
	draw_set_color(c_yellow);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}