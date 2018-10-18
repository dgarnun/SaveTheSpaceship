// On first mouse click, robot is selected. Second click and is deselected.
is_selected = !is_selected;
if (is_selected) {
	global.selected_robot = id;
} else {
	global.selected_robot = noone;
}