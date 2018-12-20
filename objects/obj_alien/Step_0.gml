// Aliens steal fuel every time is not captured
global.ship_fuel -= 1;

// Detect a captured by a robot
if place_meeting(x, y, obj_robot_parent) {
	instance_destroy(self);
	score += global.score_for_destroy_alien;
}

_x = irandom_range(-target_offset, target_offset);
_y = irandom_range(-target_offset, target_offset);

alarm[0] = 60;

if not path_exists(alien_path) {
	if (mp_grid_path(alien_grid, alien_path, x, y, _x+x, _y+y, false)) {
		path_start(alien_path, speed, path_action_stop, 0);
	}
}
