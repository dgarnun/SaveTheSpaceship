// Scores
global.score_for_hull_repair = 10;
global.score_for_finish_level = 1000;
global.score_for_repair_robot = 5;
global.score_for_destroy_alien = 250;

// Create all robot related variables and instances
global.selected_robot = noone;
global.robot_instances_layer = layer_get_id("robots");
global.marvin = instance_create_layer(1100, 780, global.robot_instances_layer, obj_robot_marvin);
global.hal = instance_create_layer(1180, 780, global.robot_instances_layer, obj_robot_hal);
global.arnold = instance_create_layer(1100, 860, global.robot_instances_layer, obj_robot_arnold);
global.data = instance_create_layer(1180, 860, global.robot_instances_layer, obj_robot_data);

// Alien map and positional arrays
global.alien_map = ds_map_create();
alien_array[0,0] = 475; alien_array[0,1] = 800;
alien_array[1,0] = 2000; alien_array[1,1] = 800;
alien_array[2,0] = 2000; alien_array[2,1] = 1250;
alien_array[3,0] = 2000; alien_array[3,1] = 300;
alien_array[4,0] = 730; alien_array[4,1] = 275;
alien_array[5,0] = 710; alien_array[5,1] = 1350;
alien_array[6,0] = 2240; alien_array[6,1] = 500;
alien_array[7,0] = 1560; alien_array[7,1] = 540;
alien_array[8,0] = 1500; alien_array[8,1] = 1375;
alien_array[9,0] = 2175; alien_array[9,1] = 1200;

// Level variables
global.level = 1;
global.event_ticker = 0;
global.number_of_concurrent_aliens = 1;
global.gameover = false;

// Create a ship
global.ship = instance_create_layer(0, 0, layer_get_id("control"), obj_ship_status);

// Set main camera and speed and shake state
global.camera_shake = 0;
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

// Turn off layers when in initial game menu
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