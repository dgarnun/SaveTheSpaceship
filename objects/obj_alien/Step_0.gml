// Aliens steal fuel every time is not captured
global.ship_fuel -= 1;

// Detect a captured by a robot
var robot_id = instance_place(x, y, obj_robot_parent);
if robot_id {
	audio_play_sound(snd_robot_hit, 10, false);
	score += global.score_for_destroy_alien;
	robot_id.robot_integrity -= 10;
	global.number_of_concurrent_aliens -= 1;
	ds_map_delete(global.alien_map, id);
	audio_play_sound(snd_alien_captured, 10, false);
	instance_destroy(self);
}

