// If we have a target we can have a computed path
if has_target {
	mp_potential_path(path, x_target, y_target, 1, 4, false);
	path_start(path, robot_speed, path_action_stop, 0);
}

// If we are not the selected robot...
if global.selected_robot != id
	is_selected = false;
	
// Draw energy if robot is moving
if has_target && (x != x_target) && (y != y_target)
	robot_battery -= robot_consumption;

if robot_battery <= 0
	robot_battery = 0;