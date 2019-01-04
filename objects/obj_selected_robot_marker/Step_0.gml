if (global.selected_robot) {
	var robot_instance = global.selected_robot;
	var robot_sprite_idx = object_get_sprite(robot_instance);
	
	x = ((robot_instance)).x;
	y = ((robot_instance)).y - 38;
}	