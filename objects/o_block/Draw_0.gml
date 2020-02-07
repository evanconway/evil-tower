/// @description 

if (v_block_drawsprite) draw_self();

if (global.bboxs_visible) {
	draw_set_alpha(1);
	draw_set_color(c_blue);
	draw_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_top, true);
}
