// If our robot has a target update the path to the target
if (has_target) {
	mp_potential_path(path, x_target, y_target, 1, 1, true);
	path_start(path, robot_speed, path_endaction, 0);
}