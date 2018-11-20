if pause {
	
	// First deactivate all instances
	instance_deactivate_all(true);
	
	if not instructions {
		// Print Game Logo
		draw_set_color(c_yellow);
		draw_text_transformed(camera_get_view_width(cam) * 0.4, camera_get_view_height(cam) * 0.7, "SAVE THE SPACESHIP!", 3, 3, 0);
	
		// Print Menu
		var i = 0;
		repeat(buttons) {
	
			draw_set_font(fnt_GUI);
			draw_set_halign(fa_center);
			draw_set_color(c_ltgray);
	
			if (menu_index == i) draw_set_color(c_fuchsia);
	
			draw_text(menu_x, menu_y + button_h * i, button[i]);
			++i;
		}	
	}

}