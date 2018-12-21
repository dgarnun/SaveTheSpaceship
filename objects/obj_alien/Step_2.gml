// If alien is not moving then it needs another path
if (x == xprevious and y == yprevious) {
	_x = irandom_range(-target_offset, target_offset);
	_y = irandom_range(-target_offset, target_offset);
	if (mp_grid_path(alien_grid, alien_path, x, y, x+_x, y+_y, false)) {
		path_start(alien_path, 2, path_action_stop, 0);
	}
}
