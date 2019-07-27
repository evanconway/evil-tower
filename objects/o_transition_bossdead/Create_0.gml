event_inherited();

/*
There's a scene script that runs the boss fight. 
scr_scene_boss_run
Look there for more details on how the boss is dying. This current system is flawed.
We should be putting the death animation for the boss here, but it's actually easier
to do it in the scene script because this transition doesn't have access to the ID
of the boss. Since we know there's only going to be one, we could just use o_slugboss,
but that's not elegant. Not the best reason not to do something, but whatever. We
should think of a cleaner design for the next project. For now, the only reason the 
boss has a death scene is too keep it from getting deleted automatically. See the
hurt state code for more details on how that works.
*/
