/// @description Ensure AI can run

if (v_ai_actor == undefined ||
	v_ai_actor.v_act_inputlocktime > 0 ||
	global.freezeactors) {
	v_ai_end = true;
	exit;
} else v_ai_end = false;
