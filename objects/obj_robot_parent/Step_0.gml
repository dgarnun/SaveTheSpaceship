//if (has_target) {
//	//move_towards_point(x_target, y_target, robot_speed);
//	if (x < x_target) {
//		x += robot_speed;
//	}

//	if (x > x_target) {
//		x -= robot_speed;
//	}

//	if (y < y_target) {
//		y += robot_speed;
//	}

//	if (y > y_target) {
//		y -= robot_speed;
//	}
//}

if (has_target) {
	if mp_grid_path(global.grid, path, x, y, x_target, y_target, false)
      {
      path_start(path, 1, path_action_continue, 0);
      }
}