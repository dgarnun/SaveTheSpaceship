// Randomize. Useful to call at start to reset random seed
randomize();

// Set game font for the GUI
draw_set_font(fnt_GUI);

// Create all robot related variables and instances
global.selected_robot = noone;
global.robot_instances_layer = layer_get_id("robots");
global.marvin = instance_create_layer(300, 670, global.robot_instances_layer, obj_robot_marvin);
global.hal = instance_create_layer(364, 734, global.robot_instances_layer, obj_robot_hal);

cam = view_camera[0];
camera_speed = 10;

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

// Create the navigation grid
var cell_size = 64;
var max_horizontal_tiles = room_width / cell_size;
var max_vertical_tiles = room_height / cell_size;

// Pause
pause = false;

