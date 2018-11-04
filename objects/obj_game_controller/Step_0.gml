// Keyboard check for camera movement
if (keyboard_check(ord("W"))) {
	y -= camera_speed;
}
if (keyboard_check(ord("S"))) {
	y += camera_speed;
}
if (keyboard_check(ord("A"))) {
	x -= camera_speed;
}
if (keyboard_check(ord("D"))) {
	x += camera_speed;
}

// Set camera on robots
// 1 -> Marvin
if keyboard_check(ord("1")) {
	global.selected_robot = global.marvin;
	global.marvin.is_selected = true;
	x = global.marvin.x;
	y = global.marvin.y;
}
// 2 -> Hal
if keyboard_check(ord("2")) {
	global.selected_robot = global.hal;
	global.hal.is_selected = true;
	x = global.hal.x;
	y = global.hal.y;
}
// 3 -> Arnold
if keyboard_check(ord("3")) {
	global.selected_robot = global.arnold;
	global.arnold.is_selected = true;
	x = global.arnold.x;
	y = global.arnold.y;
}
// 4 -> Data
if keyboard_check(ord("4")) {
	global.selected_robot = global.data;
	global.data.is_selected = true;
	x = global.data.x;
	y = global.data.y;
}

// x and y value cannot be less than view_?_half or more than  
x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

// Set position and move the cam
camera_set_view_pos(cam, x - view_w_half , y - view_h_half);

// If have a robot selected and we click on a tile, then the robot has a target
if (mouse_check_button(mb_left)) {
	if (global.selected_robot) {
		var instance = global.selected_robot;
		with ((instance)) {
			x_target = mouse_x;
			y_target = mouse_y;
			has_target = true;
			if mp_grid_path(global.grid, path, x, y, x_target, y_target, false) {
				path_start(path, robot_speed, path_action_stop, 0);
			}
		}	
	}	
}