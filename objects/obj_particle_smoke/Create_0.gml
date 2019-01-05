// Particle
part_type = part_type_create();
part_type_shape(part_type, pt_shape_smoke);
part_type_alpha3(part_type, 0, 1, 0);
part_type_size(part_type, 0.2, 0.5, -0.005, 0);
part_type_colour_mix(part_type, c_gray, c_black);
part_type_speed(part_type, 0.1, 0.5, 0, 0);
part_type_direction(part_type, 0, 359, 0, 0);
part_type_gravity(part_type, 0.02, 90);
part_type_life(part_type, room_speed * 2, room_speed * 4);
//part_type_blend(part_type, true);

// Particle emitter
part_emitter = part_emitter_create(global.part_system);
part_emitter_region(global.part_system, part_emitter, x, x+16, y, y+16, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_stream(global.part_system, part_emitter, part_type, 2);

// Lifespan
alarm[0] = 60;
