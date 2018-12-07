// Basic GUI Items
draw_set_color(c_white);
draw_text(5, 5, "Level " + string(global.level));
draw_text(500, 5, "Score " + string(global.points));

// Robot panel overlay
draw_set_color(c_black);
draw_set_alpha(0.20);
draw_rectangle(10, 698, 1270, 762, 0);
draw_set_alpha(1);