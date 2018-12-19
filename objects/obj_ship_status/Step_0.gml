// Limit parameter levels
global.ship_distance_to_earth = clamp(global.ship_distance_to_earth, 0, 10000);
global.ship_fuel = clamp(global.ship_fuel, 0, 10000);
global.ship_hull = clamp(global.ship_hull, 0, 10000);