event_inherited();

/*
Ladders are very tricky. We have decided to implement ladders as objects that sit on top of walls. This means
that in order for the actor to correctly use a ladder, it will go through a wall. When we make our next game,
we need to find a better solution since this just feels weird.

Also to make our lives simple. Ladder placement must follow a few simple rules.
1. Ladders are perfectly vertical. No diagonal or slightly off center ladders.
2. Ladders can never overlap.
*/

v_state_ladder_climbspd = 1.1;
// imageindex used for making climbing sounds. -1 ensures variable does not match image index when entering state.
v_state_ladder_imageindex = -1;
