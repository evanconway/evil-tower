var heartWidth = sprite_get_width(s_heart);
var healthWidth = heartWidth * 3;
var healthHeight = sprite_get_height(s_heart);
var border = 3;
var plrHealth = 0;
if (instance_exists(o_player)) {
	plrHealth = o_player.v_act_state_hurt.v_state_hurt_health;
	healthWidth = heartWidth * o_player.v_act_state_hurt.v_state_hurt_health_max;
}
if (global.draw_hud) && (instance_exists(o_player)) &&(plrHealth > 0)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_rectangle(0, 0, healthWidth + border*2, healthHeight + border*2, false);
	draw_set_color(c_black);
	draw_rectangle(border, border, border + healthWidth, border + healthHeight, false);
	for (var i = 0; i < plrHealth; i++) // this used to check global.player_health
	{
		draw_sprite(s_heart, 10, border + i*heartWidth, border);
	}
}
/*
draw_set_font(f_menu);
draw_set_color(c_white);
draw_text(75, 2, "Area: " + room_get_name(room));
draw_set_halign(fa_right);
draw_text(global.resolution_width-10, 2, "Alpha Build");
*/