if pause {
	switch (menu_index) {
		case 0:
			pause = false;
			game_init = true;
			var index = 0;
			repeat(ds_list_size(global.layers) ) {
				layer_set_visible(layer_get_id(global.layers[| index++]), true);
			}
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