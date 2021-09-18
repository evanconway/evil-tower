/// @description scr_act_kill(o_actor)
/// @param actor_id
function scr_act_kill() {

	var ID = argument[0];
	var hurt = ID.v_act_state_hurt;

	ID.v_act_state_cur = hurt;
	hurt.v_state_hurt_health = 0;

	if (hurt.v_state_hurt_dead_scene == undefined) {
		// we won't bother creating death effects if there is a death scene, we'll assume that handles everything
		if (hurt.v_state_hurt_dead_fx != undefined) instance_create_layer(ID.x, ID.y, "Enemies", hurt.v_state_hurt_dead_fx);
		if (hurt.v_state_hurt_dead_snd != undefined) scr_playsfx(hurt.v_state_hurt_dead_snd);
		ds_list_add(global.enemies_slain, ID);
		instance_destroy(ID);
	} else instance_create_depth(ID.x, ID.y, global.transition_layer, hurt.v_state_hurt_dead_scene);



}
