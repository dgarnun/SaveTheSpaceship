// Draw fuel indicator
draw_set_color(c_white);
var _x = 764;
draw_text(_x, 700, "Fuel ");
var fuel_units = round(fuel / 25);
for (var i = 0; i < fuel_units ; i += 8) {
	draw_sprite(spr_ship_fuel_unit, 0, (_x+i+70), 702);
}

draw_text(_x, 716, "Hull ");
var hull_units = round(hull / 25);
for (var i = 0; i < hull_units ; i += 8) {
	draw_sprite(spr_ship_hull_unit, 0, (_x+i+70), 720);
}

draw_text(_x, 732, "Dist ");
var dist_units = round(distance_to_earth / 25);
for (var i = 0; i < dist_units ; i += 8) {
	draw_sprite(spr_ship_dist_unit_11, 0, (_x+i+70), 738);
}
