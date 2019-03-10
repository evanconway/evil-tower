/// @description Insert description here
// You can write your code in this editor

if (v_act_state_cur != undefined && v_act_state_cur.v_state_draw_behind != undefined) {
	script_execute(v_act_curstate.v_state_draw_behind, id);
}

if (sprite_index != undefined) {
	if (global.actors_visible) {
		draw_set_alpha(1);
		draw_self();
	}

	draw_set_color(c_lime);
	if (global.bboxs_visible) {
		draw_set_color(v_act_bbox_color);
		draw_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_top, true);
	}
}

if (v_act_state_cur != undefined && v_act_state_cur.v_state_draw_front != undefined) {
	script_execute(v_act_state_cur.v_state_draw_front, id);
}
