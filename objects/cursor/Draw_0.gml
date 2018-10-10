/// @description Insert description here
// You can write your code in this editor
//draw_text(20,20, "Viewport x:" + view_get_xport(0));
var current_x = camera_get_view_x(camera_get_active());

draw_text(current_x+20,40, "Mouse x: " + string(mouse_x));