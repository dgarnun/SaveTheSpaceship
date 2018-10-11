/// @description Insert description here
// You can write your code in this editor

// Get mouse position
xTo = mouse_x;
yTo = mouse_y;

// Object position (center of the camera) is 1/4 difference between 'camera' and mouse
// The lesser the difference the softer is the scrolling updated
x += (xTo - x) / 15;
y += (yTo - y) / 15;

// x and y value cannot be less than view_?_half or more than  
x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

// Set position to move the cam
camera_set_view_pos(cam, x - view_w_half , y - view_h_half);

