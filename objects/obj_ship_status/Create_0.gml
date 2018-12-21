// Max levels
global.max_ship_levels = 10000;

// Global ship variables
global.ship_distance_to_earth = global.max_ship_levels * 0.66;
global.ship_fuel = global.max_ship_levels;
global.ship_hull = global.max_ship_levels;

// Alarm set to signal fuel consumption
alarm[0] = 120;