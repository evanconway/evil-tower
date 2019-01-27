/// @description Insert description here
// You can write your code in this editor

if (v_ballspawner_time < 0) {
	instance_create_layer(x, y, "Enemies", o_emy_ball);
	v_ballspawner_time = v_ballspawner_time_max + irandom_range(v_ballspawner_rand_min, v_ballspawner_rand_max);
} else v_ballspawner_time--;