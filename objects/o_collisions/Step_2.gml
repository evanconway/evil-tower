/// @description Handle Collisions

/*
Are we even using this? I think this is totally unused.
*/

/*
Instead of having actors and hitboxes detect collisions, we detect them here.
This allows us
*/

for (var i = 0; i < instance_number(obj_Enemy); i += 1) {
   enemy[i] = instance_find(obj_Enemy,i);
}