// Pause
if (keyboard_check(ord("P"))) {
	if (!pause) {
		pause = true;
		instance_deactivate_all(true);
	} else {
		pause = false;
		instance_activate_all();
	}
}

// Pause game
if pause {
	draw_set_color(c_black);
	draw_set_alpha(0.60);
	draw_rectangle(view_xport[0], view_yport[0], view_wport[0], view_hport[0], 0);
	// https://www.dafont.com/es/arcade-ya.font
	//draw_set_font(fnt_GUI);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(view_h_half, view_w_half/2, "Paused, press 'p' to resume game");
}

draw_set_color(c_black);
draw_set_alpha(0.20);
draw_rectangle(10, 698, 1270, 762, 0);
draw_set_alpha(1);