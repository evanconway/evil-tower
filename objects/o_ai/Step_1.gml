/// @description Ensure AI can run

if (v_ai_actor == undefined) {
	v_ai_end = true;
	exit;
}
if (v_ai_actor.v_act_inputlocktime > 0) {
	v_ai_end = true;
	exit;
}