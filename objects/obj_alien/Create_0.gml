// Play intro sound when a alien is created
audio_play_sound(snd_alien_incomming, 10, false);

// Alien navigation grid
alien_grid = mp_grid_create(0, 0, max_horizontal_tiles, max_vertical_tiles, cell_size, cell_size);
mp_grid_add_instances(alien_grid, external_walls, true);
mp_grid_add_instances(alien_grid, obj_walls_parent, true);
mp_grid_add_instances(alien_grid, obj_robot_parent, true);

