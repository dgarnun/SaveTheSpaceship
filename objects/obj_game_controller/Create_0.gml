// Create all robot related variables and instances
global.selected_robot = noone;
global.robot_instances_layer = layer_get_id("robots");
global.marvin = instance_create_layer(300, 670, global.robot_instances_layer, obj_robot_marvin);
global.hal = instance_create_layer(300, 700, global.robot_instances_layer, obj_robot_hal);

cam = view_camera[0];
camera_speed = 10;

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

// Create the navigation grid
var cell_size = 64;
var grid_starting_x = 0;
var grid_starting_y = 0;
var max_horizontal_tiles = room_width / cell_size;
var max_vertical_tiles = room_height / cell_size;

global.grid = mp_grid_create(grid_starting_x, grid_starting_y, max_horizontal_tiles, max_vertical_tiles, cell_size, cell_size);

// for loops
var _w = max_horizontal_tiles;
var _h = max_vertical_tiles;
var walls_tilemap = layer_tilemap_get_id(layer_get_id("Walls"));

for (var i = 0; i < _w; i++) {
	for (var j = 0; j < _h; j++) {
		if (tilemap_get(walls_tilemap, i, j)) {
			mp_grid_add_cell(global.grid, i, j);
		}
	}
}