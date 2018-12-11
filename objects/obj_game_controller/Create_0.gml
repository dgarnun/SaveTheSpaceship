// Create all robot related variables and instances
global.selected_robot = noone;
global.robot_instances_layer = layer_get_id("robots");
global.marvin = instance_create_layer(1100, 780, global.robot_instances_layer, obj_robot_marvin);
global.hal = instance_create_layer(1180, 780, global.robot_instances_layer, obj_robot_hal);
global.arnold = instance_create_layer(1100, 860, global.robot_instances_layer, obj_robot_arnold);
global.data = instance_create_layer(1180, 860, global.robot_instances_layer, obj_robot_data);
 
// Level variables
global.level = 1;
global.points = 0;

// Create a ship
global.ship = instance_create_layer(0, 0, layer_get_id("control"), obj_ship_status);

// Set main camera and speed 
cam = view_camera[0];
camera_speed = 10;

// Save original view values
view_w = camera_get_view_width(cam);
view_h = camera_get_view_height(cam);
// Set initial camera size
view_wview = view_w;
view_hview = view_h;
// Values at half
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;
// Initiate zoom factor
zoom_factor = 1;
// No zoom when game starts
zoom_view = false;

// Turn off layer when in initial game menu
var index = 0;
repeat(ds_list_size(global.layers) ) {
	layer_set_visible(layer_get_id(global.layers[| index++]), false);
}

// Path navigation
var cell_size = 64;
var max_horizontal_tiles = room_width / cell_size;
var max_vertical_tiles = room_height / cell_size;
global.grid = mp_grid_create(0, 0, max_horizontal_tiles, max_vertical_tiles, cell_size, cell_size);
mp_grid_add_instances(global.grid, external_walls, true);
mp_grid_add_instances(global.grid, obj_walls_parent, true);

// Background music
audio_play_sound(snd_background_music, 1, true);