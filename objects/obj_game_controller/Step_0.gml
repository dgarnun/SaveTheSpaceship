// Pause
if (keyboard_check(ord("P"))) {
	if (!pause) {
		pause = true;
		instance_deactivate_all(true);
	} else {
		pause = false;
		instance_activate_all();
	}
}

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

// Fullscreen
if (keyboard_check(vk_f4)) {
	if window_get_fullscreen() {
		window_set_fullscreen(false);
	}
	else {
		window_set_fullscreen(true);
	}
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

// x and y value cannot be less than view_?_half or more than  
x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

// Set position and move the cam
camera_set_view_pos(cam, x - view_w_half , y - view_h_half);

// If have a robot selected and we click on a tile, then the robot has a target
if (mouse_check_button(mb_left)) {
	if (global.selected_robot) {
		var instance = global.selected_robot;
		(instance).x_target = mouse_x;
		(instance).y_target = mouse_y;
		(instance).has_target = true;
	}	
}
