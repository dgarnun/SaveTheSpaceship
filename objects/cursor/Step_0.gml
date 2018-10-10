/// @description Insert description here
// You can write your code in this editor

var default_camera = camera_get_active();
var cursor_x = camera_get_view_x(default_camera);
var cursor_y = camera_get_view_x(default_camera);

if mouse_x < (cursor_x + 100) and cursor_x >=2 {
	camera_set_view_pos(default_camera, cursor_x+2, cursor_y);
}

if mouse_x > (cursor_x - 100) and cursor_x <= (576+2) {
	camera_set_view_pos(default_camera, cursor_x-2, cursor_y);
}