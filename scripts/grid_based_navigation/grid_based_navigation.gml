// Path navigation
max_horizontal_tiles = 2560/64;
max_vertical_tiles = 1600/64;
global.grid = mp_grid_create(0, 0, max_horizontal_tiles, max_vertical_tiles, 64, 64);

var _w = max_horizontal_tiles;
var _h = max_vertical_tiles;
var collisions_tilemap = layer_tilemap_get_id(layer_get_id("instance_walls"));
var counter = 0;
for (var i = 0; i < _w; i++) {
	for (var j = 0; j < _h; j++) {
		if (tilemap_get(collisions_tilemap, i, j)) {
			counter++;
			mp_grid_add_cell(global.grid, i, j);
		}
	}
}
mp_grid_add_instances(global.grid, external_walls, true);


// If we have a target we can have a computed path
if has_target {
	if mp_grid_path(global.grid, path, x, y, x_target, y_target, false) {
		path_start(path, robot_speed, path_action_stop, 0);
	} else {
		show_debug_message("No path found");
	}	
}