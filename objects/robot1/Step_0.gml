
if (has_target) {
	//move_towards_point(x_target, y_target, robot_speed);
	if (x < x_target) {
		x += robot_speed;
	}

	if (x > x_target) {
		x -= robot_speed;
	}

	if (y < y_target) {
		y += robot_speed;
	}

	if (y > y_target) {
		y -= robot_speed;
	}
}