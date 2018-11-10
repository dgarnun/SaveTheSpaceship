if game_init 
	button[0] = "Continuar";

if pause {
	menu_move = keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	menu_index += menu_move;

	if (menu_index < 0) menu_index = buttons - 1;
	if (menu_index > buttons - 1) menu_index = 0;

	last_selected = menu_index;
}

// Pause
if (keyboard_check(vk_escape)) {
	var index = 0;
	repeat(ds_list_size(global.layers) ) {
		layer_set_visible(layer_get_id(global.layers[| index++]), false);
	}
	pause = true;
	instructions = false;
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



