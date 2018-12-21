// Keyboard check for camera movement
if (keyboard_check(ord("W"))) {
	y -= camera_speed;
}
if (keyboard_check(ord("S"))) {
	y += camera_speed;
}
if (keyboard_check(ord("A"))) {
	x -= camera_speed;
}
if (keyboard_check(ord("D"))) {
	x += camera_speed;
}

// Set camera on robots
// 1 -> Marvin
if keyboard_check(ord("1")) {
	global.selected_robot = global.marvin;
	global.marvin.is_selected = true;
	x = global.marvin.x;
	y = global.marvin.y;
	audio_play_sound(snd_select_robot, 5, false);
}
// 2 -> Hal
if keyboard_check(ord("2")) {
	global.selected_robot = global.hal;
	global.hal.is_selected = true;
	x = global.hal.x;
	y = global.hal.y;
	audio_play_sound(snd_select_robot, 5, false);
}
// 3 -> Arnold
if keyboard_check(ord("3")) {
	global.selected_robot = global.arnold;
	global.arnold.is_selected = true;
	x = global.arnold.x;
	y = global.arnold.y;
	audio_play_sound(snd_select_robot, 5, false);
}
// 4 -> Data
if keyboard_check(ord("4")) {
	global.selected_robot = global.data;
	global.data.is_selected = true;
	x = global.data.x;
	y = global.data.y;
	audio_play_sound(snd_select_robot, 5, false);
}

// Camera variables
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;
// x and y value cannot be less than view_?_half or more than  
x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

// Shake camera (for hull impacts)
x += random_range(-global.camera_shake, global.camera_shake);
y += random_range(-global.camera_shake, global.camera_shake);
global.camera_shake *= 0.9;

// Set position and move the cam
camera_set_view_pos(cam, x - view_w_half , y - view_h_half);

// Zoom subsystem
if keyboard_check_pressed(ord("Z")) {
	zoom_view = !zoom_view;
	audio_play_sound(snd_zoom, 1, false);
}
if (zoom_view) {
	zoom_factor += 0.05;
} else {
	zoom_factor -= 0.05;
}
zoom_factor = clamp(zoom_factor, 1, 2);
view_wview = view_w * zoom_factor;
view_hview = view_h * zoom_factor;
view_wview = clamp(view_wview, view_w, 2560);
view_hview = clamp(view_hview, view_h, 1600);
camera_set_view_size(cam, view_wview, view_hview);

// Send a target to the selected robot
if (mouse_check_button(mb_left)) {
	if (global.selected_robot) {
		audio_play_sound(snd_robot_affirmative, 1, false);
		var instance = global.selected_robot;
		with ((instance)) {
			x_target = mouse_x;
			y_target = mouse_y;
			has_target = true;
		}
	}	
}

// Random difficult-driven event generation subsystem (hull impacts)
// 
// First, let's see if we can trigger an event
if global.event_ticker > 60 {
	randomize();
	// The greater the level the more chances we have
	var upper_range = clamp(30 - global.level, 1, 30);
	
	// Get some tickets for aliens
	for (var i = 0; i <= (global.level * 4) ; i++) {
		var ticket = irandom_range(1, upper_range);
		var winner = round(upper_range / 2);
		if (ticket == winner and (global.number_of_concurrent_aliens < global.level)) {
			// Spawn an Alien 
			var alien = instance_create_layer(2000, 800, layer_get_id("control"), obj_alien);
			ds_map_add(global.alien_map, alien, alien);
			continue;
		}
	}

	// Get some tickets for meteor impacts
	for (var i = 0; i <= global.level ; i++) {
		var ticket = irandom_range(1, upper_range);
		var winner = irandom_range(1, upper_range);	

		if ticket == winner {
			audio_play_sound(snd_meteoric_impact, 10, 0);
			// Impact is hardened with difficult
			global.ship_hull -= (300 + global.level);
			global.camera_shake = 15;
		}
	}

	// Event has taken place, reset event counter
	global.event_ticker = 0;
}
global.event_ticker += 1;

// We have reached the earth, level up, reset values, harder the game!
if global.ship_distance_to_earth <= 0 {
	
	// LevelUp!
	audio_play_sound(snd_levelup, 11, false);
	score += global.score_for_finish_level;
	global.level += 1;
	if global.level > 30 {
		// You finished the game
	}
	
	// Reset ship
	instance_destroy(global.ship);
	global.ship = instance_create_layer(0, 0, layer_get_id("control"), obj_ship_status);
	
	// Reset robots
	instance_destroy(obj_robot_parent);
	global.selected_robot = noone;
	global.robot_instances_layer = layer_get_id("robots");
	global.marvin = instance_create_layer(1100, 780, global.robot_instances_layer, obj_robot_marvin);
	global.hal = instance_create_layer(1180, 780, global.robot_instances_layer, obj_robot_hal);
	global.arnold = instance_create_layer(1100, 860, global.robot_instances_layer, obj_robot_arnold);
	global.data = instance_create_layer(1180, 860, global.robot_instances_layer, obj_robot_data);
	
	// Destroy aliens and clear their map
	global.number_of_concurrent_aliens = 0;
	instance_destroy(obj_alien);
	ds_map_clear(global.alien_map);
}

// Game over
if global.ship_fuel <= 0 or global.ship_hull <= 0 {
	audio_play_sound(snd_gameover, 11, false);
	global.gameover = true;
}
