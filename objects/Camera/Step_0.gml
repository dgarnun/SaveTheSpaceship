/// @description Insert description here
// You can write your code in this editor

xTo = mouse_x;
yTo = mouse_y;

x += (xTo - x) / 25;
y += (yTo - y) / 25;

move_x = x - view_w_half;
if move_x < 0 {
	move_x = 0;
}


if move_x > max_x_view {
	move_x = max_x_view;
}

move_y = y - view_h_half;
if move_y < 0 {
	move_y = 0;
}

if move_y > max_y_view {
	move_y = max_y_view;
}

camera_set_view_pos(cam, move_x, move_y);

