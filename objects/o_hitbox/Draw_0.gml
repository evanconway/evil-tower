/// @description 

if (global.bboxs_visible) {
	draw_set_alpha(1);
	draw_set_color(c_red);
	draw_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_top, true);
}