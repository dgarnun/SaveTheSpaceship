// If our alien hasn't move we have to get another target
if (x != xprevious || y != yprevious) {
	_x = irandom_range(-target_offset, target_offset);
	_y = irandom_range(-target_offset, target_offset);
}