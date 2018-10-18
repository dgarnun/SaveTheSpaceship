// If our robot has a target update the path to the target
if (has_target) {
	if mp_grid_path(global.grid, path, x, y, x_target, y_target, false)
      {
      path_start(path, 1, path_action_continue, 0);
      }
}