if pause {
	
	// First deactivate all instances
	instance_deactivate_all(true);
	
	if not instructions {
		// Print Game Logo
		draw_set_color(c_yellow);
		draw_text_transformed(camera_get_view_width(cam) * 0.22, camera_get_view_height(cam) * 0.45, "SAVE THE SPACESHIP!", 2.5, 2.5, 0);
	
		// Print Menu
		var i = 0;
		repeat(buttons) {
			draw_set_font(fnt_GUI);
			draw_set_halign(fa_left);
			draw_set_color(c_ltgray);
	
			if (menu_index == i) 
				draw_set_color(c_fuchsia);

			draw_text(menu_x - 20, menu_y + button_h * i, button[i]);
			++i;
			
			// Mini help
			draw_set_color(c_ltgray);
			draw_text_transformed(1080, 720, "(WASD + Enter)", 0.7, 0.7, 0);
		}	
	} else {
		// Print instructions
		draw_set_color(c_ltgray);
		draw_text(20, 30, "Camera: W - Up; S - Down; A - Left; D - Right");
		draw_text(20, 60, "\"1\" select Marvin");
		draw_text(20, 90, "\"2\" select HAL");
		draw_text(20, 120, "\"3\" select Arnold");
		draw_text(20, 150, "\"4\" select Data");
		draw_text(20, 180, "use mouse to point and click");
		draw_text(20, 210, "BAT stands for batteries level");
		draw_text(20, 240, "INT stands for robot integrity");
		draw_text(20, 270, "press ESC in game for pause");
		draw_text(20, 720, "Press ESC to get back...");
	}
}