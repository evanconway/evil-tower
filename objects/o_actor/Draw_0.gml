/// @description Insert description here
// You can write your code in this editor

if (v_act_state_cur != undefined && v_act_state_cur.v_state_draw_behind != undefined) {
	script_execute(v_act_state_cur.v_state_draw_behind, id);
}

if (sprite_index != undefined) {
	if (global.actors_visible) {
		draw_set_alpha(1);
		if (v_act_shadertime > 0 && v_act_shader != undefined) {
			shader_set(v_act_shader);
			v_act_shadertime--;
		}
		image_alpha = v_act_alpha;
		draw_self();
		shader_reset(); // what is this and why is this here?
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
