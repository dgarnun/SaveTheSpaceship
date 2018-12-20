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

// Limit battery and integrity values
robot_battery = clamp(robot_battery, 0, 100);
robot_integrity = clamp(robot_integrity, 0, 100);

// Recognize when robot is on a charging area
if place_meeting(x, y, obj_charge_area) {
	robot_battery += robot_charging_speed;
}

// Shutdown robot if battery level is 0
if (robot_battery == 0 || robot_integrity == 0) && !has_been_shutdown {
	if path_exists(path) path_end();
	audio_play_sound(snd_robot_shutdown, 1, false);
	has_been_shutdown = true;
	robot_speed = 0;
}

// Reinitiate robot if battery has been recharged
if robot_battery >= 25 && has_been_shutdown {
	audio_play_sound(snd_robot_reinitialization, 10, false);
	has_been_shutdown = false;
	robot_speed = fixed_robot_speed;
	score += global.score_for_repair_robot;
}

// Recognize when robot is on a hull reparing area
if place_meeting(x, y, obj_hull_repair_area) {
	global.ship_hull += robot_repairing_speed;
	if global.ship_hull < 10000 {
		score += 0.25;
	}
}

// Recognize when robot is on a refueling  area
if place_meeting(x, y, obj_refueling_area) {
	global.ship_fuel  += robot_repairing_speed;
	if global.ship_fuel  < 10000 {
		score += 0.25;
	}
}

// Repair a fallen robot and recharge battery to 25%
if place_meeting(x, y, obj_robot_parent) {
	if other.has_been_shutdown or other.robot_battery < 25 {
		robot_battery += robot_charging_speed;
	}
	if other.has_been_shutdown or other.robot_integrity < 100 {
		robot_integrity += robot_repairing_speed;
	}	
}

