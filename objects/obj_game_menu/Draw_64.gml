if pause {
	
	// First deactivate all instances
	instance_deactivate_all(true);
	
	if not instructions {
		// Print Game Logo
		draw_set_color(c_yellow);
		if not game_init {
			draw_text_transformed(camera_get_view_width(cam) * 0.15, camera_get_view_height(cam) * 0.35, "SAVE THE SPACESHIP!", 3, 8, 0);
		}	
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
			
			// Version
			draw_text_transformed(1196, 10, "v." + string(round(GM_build_date)), 0.7, 0.7, 0);
		}	
	} else {
		// Instruction book
		var vertical_offset = 30;
		switch (instruction_page) {
			case 0:	// Presentation and robot selection
				
				draw_set_color(c_ltgray);
				draw_text(20, 20, "Hello operator, your mission is to remote control the robots of the cargo ship");
				draw_text(20, 50, "uocamola. The ship must get back to earth as fine as possible.");
				
				var h_robots = 400;
				var y_robots = 150;
				draw_text(h_robots, y_robots, "\"1\" select Marvin");
				draw_sprite(marvin_idle, 1, h_robots+400, y_robots);
				draw_text(h_robots, y_robots+80, "\"2\" select HAL");
				draw_sprite(hal_idle, 1, h_robots+400, y_robots+80);
				draw_text(h_robots, y_robots+160, "\"3\" select Arnold");
				draw_sprite(arnold_idle, 1, h_robots+400, y_robots+160);
				draw_text(h_robots, y_robots+240, "\"4\" select Data");
				draw_sprite(data_idle, 1, h_robots+400, y_robots+240);
				
				var after_robots_offset = y_robots + 240 + 100;
				draw_text(20, after_robots_offset, "use mouse to point and click to move the selected robot");
				draw_text(20, after_robots_offset+30, "BAT stands for batteries level");
				draw_text(20, after_robots_offset+60, "INT stands for robot integrity");
				draw_text(20, after_robots_offset+90, "press ESC in game for pause");
				
				break;
				
			case 1:
				draw_sprite(img_ins_1, 1, 20, 20);
				draw_text(20, 140, "if fuel level is depleted the ship will be lost in space...game over");
				draw_text(20, 180, "if hull level is depleted the ship will collapse...game over");
				draw_text(20, 220, "if dist level is depleted the ship will reach its destiny...level up!");
				
				draw_sprite(img_ins_2, 1, 20, 300);
				draw_text(20, 420, "if battery level is 0 the robot will shutdown");
				draw_text(20, 450, "if integrity level is 0 the robot will be broken");
				
				draw_sprite(marvin_idle, 1, 40, 520);
				draw_sprite_ext(data_idle, 1, 140, 540, 1, 1, 90, c_white, 1);
				draw_text(20, 590, "One robot can repair and shared some of its battery with a broken robot");
				draw_text(20, 620, "place a robot near other to recharge and repair");
				
				break;
				
			case 2:
				draw_text(20, 20, "Place a robot inside the repairing (green) point to heal and recharge a robot");
				draw_sprite(img_ins_3, 1, 20, 50);
				
				draw_text(20, 220, "Place a robot inside the repairing (blue) point to repair the hull");
				draw_sprite(img_ins_4, 1, 20, 250);
				
				draw_text(20, 400, "Place a robot inside the refueling (yellow) point to recharge some fuel");
				draw_sprite(img_ins_5, 1, 20, 430);				
				
				break;
				
			case 3:
				draw_text(20, 20, "if the ship is hit by a meteor the hull will suffer damage");
				draw_text(20, 50, "Aliens can beam in your ship. They are feeded with fuel.");
				draw_sprite(img_ins_6, 1, 20, 80);
				draw_text(20, 230, "Get an eye on this. They can peter out your fuel!");
				draw_text(20, 260, "Aliens can be captured by robots. But they will suffer damage.");
				
				break;
				
			default:
				break;

		} // End switch
		draw_set_color(c_ltgray);
		draw_text(20, 720, "Press (ESC) for main menu. (A) previous page, (S) next page.");
		var paginator = "Page: " + string(instruction_page+1) + " / " + string(max_instruction_pages);
		draw_text(1080, 720, paginator);
	}
}

if global.gameover {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	image_angle += 1;
	draw_set_color(c_ltgray);
	draw_text_transformed(1280 / 2, 768 / 2, "GAME OVER!", 2, 2, image_angle);
	draw_text(1280 / 2, 700, "your Score: " + string(score));
	draw_text_transformed(1080, 720, "Press (ESC) for main menu.", 0.7, 0.7, 0);
}