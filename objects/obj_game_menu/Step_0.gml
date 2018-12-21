if game_init 
	button[0] = "continue";

if pause {
	menu_move = keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	menu_index += menu_move;

	if (menu_index < 0) menu_index = buttons - 1;
	if (menu_index > buttons - 1) menu_index = 0;

	last_selected = menu_index;
}

if instructions {
	if keyboard_check_pressed(ord("A")) {
		instruction_page -= 1;
	}
	
	if keyboard_check_pressed(ord("D")) {
		instruction_page += 1;
	}
	
	instruction_page = clamp(instruction_page, 0, max_instruction_pages-1);
}

// Pause, focus and game over
if (keyboard_check_pressed(vk_escape)) {
	var index = 0;
	repeat(ds_list_size(global.layers) ) {
		layer_set_visible(layer_get_id(global.layers[| index++]), false);
	}
	
	// If we are not terminating the game we are in pause
	if !global.gameover {
		pause = true;
	} else {
		game_restart();
	}
	
	instructions = false;
}

if global.gameover and game_init {
	var index = 0;
	repeat(ds_list_size(global.layers) ) {
		layer_set_visible(layer_get_id(global.layers[| index++]), false);
	}
	instance_deactivate_all(true);
	game_init = false;
}

// Fullscreen
if (keyboard_check_pressed(vk_f4)) {
	if window_get_fullscreen() {
		window_set_fullscreen(true);
	}
	else {
		window_set_fullscreen(false);
	}
} 