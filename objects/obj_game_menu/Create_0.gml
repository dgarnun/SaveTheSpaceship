// Randomize. Useful to call at start to reset random seed
randomize();

// Set game font for the GUI
draw_set_font(fnt_GUI);

global.pause = true;
global.game_init = false;

menu_x = 64;
menu_y = 660;
button_h = 30;

button[0] = "Jugar";
button[1] = "Instrucciones";
button[2] = "Salir";
buttons = array_length_1d(button);

menu_index = 0;
last_selected = 0;