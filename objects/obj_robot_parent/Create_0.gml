// Has been this robot selected?
is_selected = false;

// Does this robot has a target?
has_target = false;

// Target x and y is where the player points to for the robot to go
x_target = noone;
y_target = noone;

// Batteries
robot_battery = 100;
robot_consumption = 1;
robot_charging_speed = 0.05;
robot_repairing_speed = 5;

// Integrity
robot_integrity = 100;

// A path for every robot
path = path_add();

has_been_shutdown = false;