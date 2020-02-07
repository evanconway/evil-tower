/// @description NO DRAW

/*
We had a bug where the o_global was getting its sprite set. We don't want this object to have a sprite.
Unfortunately we were not able to find what was causing that, however, by having an empty draw event
we ensure that even if o_global does accidentally recieve a sprite, we will never see it.
*/

/*
Now... this is also kinda stupid, but we're going to decrement freeze_game_time here.
We only have 3 official steps for logic and I'm losing track of what's happening when. 
At this point in the project, we know that no other logic code is being executed in draw
so we can safely decrement it here.
*/