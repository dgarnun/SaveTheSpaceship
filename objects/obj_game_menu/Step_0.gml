if game_init button[0] = "Continuar";

if pause {
	menu_move = keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	menu_index += menu_move;

	if (menu_index < 0) menu_index = buttons - 1;
	if (menu_index > buttons - 1) menu_index = 0;

	last_selected = menu_index;
}

// Pause
if (keyboard_check(vk_escape)) {
	layer_set_visible(layer_get_id("floor"), false);
	layer_set_visible(layer_get_id("inner_walls"), false);
	layer_set_visible(layer_get_id("instance_walls"), false);
	layer_set_visible(layer_get_id("walls"), false);
	layer_set_visible(layer_get_id("robots"), false);
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



