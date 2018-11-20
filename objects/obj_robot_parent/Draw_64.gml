if is_selected 
	draw_set_color(c_purple)
else 
	draw_set_color(c_white);
draw_text(0 + robot_gui_x_gap, 700, robot_name);

if robot_battery > 50
	draw_set_color(c_green);
else if robot_battery <= 50 && robot_battery > 20
	draw_set_color(c_yellow);
else if robot_battery <= 20
	draw_set_color(c_red);
draw_text(0 + robot_gui_x_gap, 720, "BAT: " + string(round(robot_battery)));

if robot_integrity > 50
	draw_set_color(c_green);
else if robot_integrity <= 50 && robot_integrity > 20
	draw_set_color(c_yellow);
else if robot_integrity <= 20
	draw_set_color(c_red);
draw_text(0 + robot_gui_x_gap, 740, "INT: " + string(robot_integrity));