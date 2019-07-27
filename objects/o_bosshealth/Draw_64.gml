/// @description 

var barWidth = 160;
var barHeight = 20;

var border = 3;

draw_set_alpha(1);
draw_set_color(c_gray);
var xStart = global.resolution_width/2 - barWidth/2;
var yStart = global.resolution_height -  global.resolution_height/5;
draw_rectangle(xStart - border, yStart - border, xStart + barWidth + border, yStart + barHeight + border, false);
draw_set_color(c_black);
draw_rectangle(xStart, yStart, xStart + barWidth, yStart + barHeight, false);
draw_set_color(c_red);
if (instance_exists(v_bosshealth_boss)) {
	var percent = v_bosshealth_boss.v_act_state_hurt.v_state_hurt_health/v_bosshealth_boss.v_act_state_hurt.v_state_hurt_health_max;
	if (percent != 0) draw_rectangle(xStart, yStart, xStart + barWidth*percent, yStart + barHeight, false);
}

draw_set_font(f_menu);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(global.resolution_width/2, yStart - border, "Giant Slug");

if (!instance_exists(v_bosshealth_boss)) instance_destroy(id);
