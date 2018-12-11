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

// Limit battery values
robot_battery = clamp(robot_battery, 0, 100);

// Recognize when robot is on a charging area
if place_meeting(x, y, obj_charge_area) {
	robot_battery += robot_charging_speed;
}

// Shutdown robot if battery level is 0
if robot_battery == 0 && !has_been_shutdown {
	if path_exists(path) path_end();
	audio_play_sound(snd_robot_shutdown, 1, false);
	has_been_shutdown = true;
	robot_speed = 0;
}

