// Keyboard check
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

if (keyboard_check(vk_f1)) {
	is_full = !is_full;
	window_set_fullscreen(is_full);
} 

// x and y value cannot be less than view_?_half or more than  
x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

// Set position and move the cam
camera_set_view_pos(cam, x - view_w_half , y - view_h_half);

if (mouse_check_button(mb_left)) {
	if (global.selected_robot) {
		var instance = global.selected_robot;
		(instance).x_target = mouse_x;
		(instance).y_target = mouse_y;
		(instance).has_target = true;
	}	
}
