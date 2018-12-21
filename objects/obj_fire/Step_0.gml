global.ship_hull -= fire_damage;

// Detect presence of a robot
var robot_id = instance_place(x, y, obj_robot_parent);
if robot_id {
	audio_play_sound(snd_robot_hit, 10, false);
	score += global.score_for_fire_extintion;
	robot_id.robot_integrity -= 10;
	ds_list_delete(global.fire_list, ds_list_find_index(global.fire_list, self));
	instance_destroy(self);
}