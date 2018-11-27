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
		var vertical_offset = 30;
		draw_set_color(c_ltgray);
		draw_text(20, vertical_offset, "Camera: W - Up; S - Down; A - Left; D - Right; Z - Zoom [on/off]");
		vertical_offset += 30;
		draw_text(20, vertical_offset, "press F4 for full screen [on/off]");
		vertical_offset += 30;
		draw_text(20, vertical_offset, "\"1\" select Marvin");
		vertical_offset += 30;
		draw_text(20, vertical_offset, "\"2\" select HAL");
		vertical_offset += 30;
		draw_text(20, vertical_offset, "\"3\" select Arnold");
		vertical_offset += 30;
		draw_text(20, vertical_offset, "\"4\" select Data");
		vertical_offset += 30;
		draw_text(20, vertical_offset, "use mouse to point and click");
		vertical_offset += 30;
		draw_text(20, vertical_offset, "BAT stands for batteries level");
		vertical_offset += 30;
		draw_text(20, vertical_offset, "INT stands for robot integrity");
		vertical_offset += 30;
		draw_text(20, vertical_offset, "press ESC in game for pause");
		vertical_offset += 30;
		draw_text(20, vertical_offset, "Press ESC to get back...");
	}
}