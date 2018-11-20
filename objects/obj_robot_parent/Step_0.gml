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

robot_battery = clamp(robot_battery, 0, 100);

if place_meeting(x, y, obj_charge_area) {
	robot_battery += robot_charging_speed;
}