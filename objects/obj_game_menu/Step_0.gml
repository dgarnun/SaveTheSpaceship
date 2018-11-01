if global.game_init button[0] = "Continuar";

if global.pause {
	menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	menu_index += menu_move;

	if (menu_index < 0) menu_index = buttons - 1;
	if (menu_index > buttons - 1) menu_index = 0;

	last_selected = menu_index;
}



