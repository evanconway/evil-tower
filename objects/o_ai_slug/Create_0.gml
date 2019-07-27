event_inherited();

v_ai_slug_state = 0;
v_ai_slug_counter = 0;

v_ai_slug_faceright = true;

/*
We don't want the slug to be too jerky. It's annoying to try and attack it
if there aren't predictable pauses in its behavior. To implement those
we're going to set a time called v_ai_slug_time_rst of about a second. 
As long as the v_ai_slug_counter is above this value, the ai code will
act as normal, but when it's below that, the slug won't do anything.

Lol wait, let's just call it time_min since we need a time_max anyway.
Oops, no we need a different value, otherwise they wouldn't do anything
if use min for pause time, and the value get randomly set to min.
*/
v_ai_slug_counter_pause = 40;
v_ai_slug_counter_max = 120 + v_ai_slug_counter_pause; // I think this is only relevant for walking
v_ai_slug_counter_min = 60 + v_ai_slug_counter_pause;

v_ai_slug_barftime = 30 + v_ai_slug_counter_pause;
v_ai_slug_numofbarfs_max = 2;
v_ai_slug_numofbarfs_min = 1;
v_ai_slug_numofbarfs = 0;
