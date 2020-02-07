/// @description Changes visibility

if (global.static_visible) {
	draw_set_alpha(v_static_alpha);
	draw_self();
}
if (global.bboxs_visible) {
	draw_set_alpha(1);
	draw_set_color(v_static_bbox_color);
	if (global.bboxs_visible) draw_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_top, true);
}
