// Has been this robot selected?
is_selected = false;

// Does this robot has a target?
has_target = false;

// Target x and y is where the player points to for the robot to go
x_target = noone;
y_target = noone;

// Speed. However, each robot should have a particular speed value
robot_speed = 1;

// Batteries
robot_battery = 100;
robot_consumption = 1;
robot_charging_speed = 5;

// Integrity
robot_integrity = 100;

// Path is necessary for each robot route when it is selected and has a target
path = path_add();