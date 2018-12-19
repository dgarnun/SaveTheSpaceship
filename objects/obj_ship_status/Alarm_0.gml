// Reduce distance to earth
global.ship_distance_to_earth -= 250;

// Reduce fuel due to comssumption
global.ship_fuel -= 100;

// Rearm alarm
alarm[0] = 120;