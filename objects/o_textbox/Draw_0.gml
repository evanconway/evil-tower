/// @description Draw In Gameworld
//Note that we don't actually call "draw_self()"
//this object only has a sprite to make it easier to see where
//we're placing it in the game world

if (!v_textbox_isgui) scr_textbox_draw(id);

//bbox drawn over text box
//we can't use event_inherited() because we don't want to draw the sprite;
if (global.bboxs_visible) {
	draw_set_alpha(1);
	draw_set_color(v_static_bbox_color);
	if (global.bboxs_visible) draw_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_top, true);
}