event_inherited();

/*
Quick overview of the slug boss. It can move left and right, barf slime
projectiles, and jump up then slam down.
*/

v_ai_wander_time = 0;
v_ai_wander_time_min = 60;
v_ai_wander_time_max = 120;
v_ai_wander_choice = 0;

v_ai_slamstate = 0;
v_ai_slamright = true; // this is the direction the slug jumps
v_ai_slamdist = 40;
v_ai_attackstate = 0;
