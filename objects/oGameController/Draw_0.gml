if (global.selected_robot) {
	var instance = global.selected_robot;
	draw_text(camera_get_view_x(cam), camera_get_view_y(cam), string((instance).name));
}