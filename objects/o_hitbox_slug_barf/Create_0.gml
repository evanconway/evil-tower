event_inherited();

v_hitbox_permenant = true;
v_hitbox_target = global.player;
v_hitbox_effect = o_fx_slug_barf_hit;

v_hitbox_drawsprite = true;
v_hitbox_wallends = true;
v_hitbox_destroyonhit = true;
v_hitbox_vel_x = 1.1;
v_hitbox_vel_y = -2;
v_hitbox_grv = 0.05;

scr_playsfx(snd_barf);
