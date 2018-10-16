global.selected_robot = noone;

cam = view_camera[0];
camera_speed = 10;

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

// Create the navigation grid
var cell_size = 64;
var grid_starting_x = 190;
var grid_starting_y = 190;
var max_horizontal_tiles = 32;
var max_vertical_tiles = 16;
global.grid = mp_grid_create(grid_starting_x, grid_starting_y, max_horizontal_tiles, max_vertical_tiles, cell_size, cell_size);
mp_grid_add_instances(global.grid, obj_parent_wall, true);