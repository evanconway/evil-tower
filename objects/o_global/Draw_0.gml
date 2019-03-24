/// @description NO DRAW

/*
We had a bug where the o_global was getting its sprite set. We don't want this object to have a sprite.
Unfortunately we were not able to find what was causing that, however, by having an empty draw event
we ensure that even if o_global does accidentally recieve a sprite, we will never see it.
*/
