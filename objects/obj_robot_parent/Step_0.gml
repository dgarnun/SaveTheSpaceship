// If we are not the selected robot...
if global.selected_robot != id {
	is_selected = false;
}

// Assign path when we have an active target
if has_target {
	if (mp_grid_path(global.grid, path, x, y, x_target, y_target, false)) {
		path_start(path, robot_speed, path_action_stop, 0);
		has_target = false;
	}
}

if robot_battery <= 0 {
	robot_battery = 0;
	robot_speed = 0;
}
