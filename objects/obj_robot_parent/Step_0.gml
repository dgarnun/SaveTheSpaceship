// If we are not the selected robot...
if global.selected_robot != id
	is_selected = false;
	
// Draw energy if robot is moving
if ((xprevious != x) || (yprevious != y)) {
	robot_battery -= robot_consumption;
}

if robot_battery <= 0 {
	robot_battery = 0;
	robot_speed = 0;
}

