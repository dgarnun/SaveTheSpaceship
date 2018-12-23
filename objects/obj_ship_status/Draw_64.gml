// Draw fuel indicator
draw_set_color(c_white);
var _x = 764;
draw_text(_x, 5, "Fuel ");
var fuel_units = round(global.ship_fuel / 25);
for (var i = 0; i < fuel_units ; i += 8) {
	draw_sprite(spr_ship_fuel_unit, 0, (_x+i+70), 7);
}

draw_text(_x, 21, "Hull ");
var hull_units = round(global.ship_hull / 25);
for (var i = 0; i < hull_units ; i += 8) {
	draw_sprite(spr_ship_hull_unit, 0, (_x+i+70), 23);
}

draw_text(_x, 37, "Dist ");
var dist_units = round(global.ship_distance_to_earth / 25);
for (var i = 0; i < dist_units ; i += 8) {
	draw_sprite(spr_ship_dist_unit_11, 0, (_x+i+70), 39);
}
