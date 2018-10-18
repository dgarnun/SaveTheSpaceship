// Has been the robot selected?
is_selected = false;

// Does the robot has a target?
has_target = false;

// Target x and y is where the player points to for the robot to go
x_target = noone;
y_target = noone;

// Robot speed. However, each robot should have a particular speed value
robot_speed = 1;

// Path is necessary for each robot route when it is selected and has a target
path = path_add();