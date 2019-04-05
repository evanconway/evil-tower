event_inherited();

/*
There's a lot of spaghetti code with attacking. There may be a way to clean it up,
but we're not going to bother. There are 3 key objects tied to attack: actors,
states, and hitboxes. There's a lot of data stored in the o_hitbox that seems
like it should be stored in the o_state_attack, but it worked out better to
put it in the hitbox. Hitboxes also have a reference to the actor that 
created the state that created the hitbox. See how that's kinda terrible?
Weirdly enough hitboxes don't need to care about the state that made them, but
then do need to know about the actor. This is because it's the hitbox that 
actually does the collision detecting, and for things like knockback calculation
and freezing, the hitbox needs to be able to talk to both the actor using it
and the actor it's hitting. Of course what's funny is that some hitboxes won't 
need to reference the actor that created it (like projectiles).

Also, the scr_hitbox_hurt_actor script is kind of the anchor for all of this
Most of the stuff that hitboxes do is contained there.

By default, we assume created attack states are on the ground. Air attack
scripts will have to be assigned at state creation.
*/
v_state_name = "attack";
v_state_script_continue = scr_state_attack_continue;
v_state_script_connect = scr_state_gnd_attack_connect;
v_state_script_change = scr_state_gnd_attack_change;
v_state_script_run = scr_state_gnd_attack_run;

v_state_attack_startup = 15;
v_state_attack_recovery = 15; // this also sets the v_hitbox_time variable
v_state_attack_target = o_player; // parent object, will be either o_player or o_emy
v_state_attack_offset_x = 18; // changes hitbox position, arbitrary numbers to get us started
v_state_attack_offset_y = -2;

enum enum_attack_stage {
	startup,
	recovery,
	finished
}

v_state_attack_stage = enum_attack_stage.startup;

v_state_attack_hitbox = o_hitbox;
/*
we're going to store 
*/
