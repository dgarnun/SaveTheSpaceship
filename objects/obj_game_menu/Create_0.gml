// Randomize. Useful to call at start to reset random seed
randomize();

// Layers to switch
global.layers = ds_list_create();
ds_list_add(global.layers, "inner_walls", "robots", "walls", "floor", "items", "aliens");

// Set game font for the GUI
draw_set_font(fnt_GUI);

// Initial state
pause = true;
game_init = false;
instructions = false;

menu_x = 64;
menu_y = 660;
button_h = 30;

button[0] = "Jugar";
button[1] = "Instrucciones";
button[2] = "Salir";
buttons = array_length_1d(button);

menu_index = 0;
last_selected = 0;
instruction_page = 0;
max_instruction_pages = 5;

cam = view_camera[0];