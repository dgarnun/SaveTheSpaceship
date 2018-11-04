if pause {
	switch (menu_index) {
		case 0:
			pause = false;
			game_init = true;
			layer_set_visible(layer_get_id("floor"), true);
			layer_set_visible(layer_get_id("inner_walls"), true);
			layer_set_visible(layer_get_id("instance_walls"), true);
			layer_set_visible(layer_get_id("robots"), true);
			layer_set_visible(layer_get_id("walls"), true);
			instance_activate_all();
			break;
		case 1:
			instructions = true;
			break;
		case 2:
			game_end();
			break;
	}
}