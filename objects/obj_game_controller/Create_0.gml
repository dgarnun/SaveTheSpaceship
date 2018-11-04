// Create all robot related variables and instances
global.selected_robot = noone;
global.robot_instances_layer = layer_get_id("robots");
global.marvin = instance_create_layer(1150, 700, global.robot_instances_layer, obj_robot_marvin);
global.hal = instance_create_layer(1150, 780, global.robot_instances_layer, obj_robot_hal);
global.arnold = instance_create_layer(1000, 700, global.robot_instances_layer, obj_robot_arnold);
global.data = instance_create_layer(1000, 780, global.robot_instances_layer, obj_robot_data);

cam = view_camera[0];
camera_speed = 10;

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

// Turn off layer when in initial game menu
layer_set_visible(layer_get_id("floor"), false);
layer_set_visible(layer_get_id("inner_walls"), false);
layer_set_visible(layer_get_id("instance_walls"), false);
layer_set_visible(layer_get_id("walls"), false);
layer_set_visible(layer_get_id("robots"), false);

// Path navigation
var cell_size = 64;
var max_horizontal_tiles = room_width / cell_size;
var max_vertical_tiles = room_height / cell_size;
global.grid = mp_grid_create(0, 0, max_horizontal_tiles, max_vertical_tiles, cell_size, cell_size);
mp_grid_add_instances(global.grid, external_walls, true);