// Look for collisions layer
collision_tilemap = layer_tilemap_get_id(layer_get_id("collisions"));

// Set the bbox of the current sprite
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);


if (x - x_target < 0) {
	var t1 = tilemap_get_at_pixel(collision_tilemap, bbox_left, bbox_bottom) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(collision_tilemap, bbox_right, bbox_bottom) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0) {
		y = ((bbox_bottom & ~63) - 1) - sprite_bbox_bottom;
	}
	
} else {
	
	var t1 = tilemap_get_at_pixel(collision_tilemap, bbox_left, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(collision_tilemap, bbox_right, bbox_top) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0) {
		y = ((bbox_top + 64 ) & ~63) - sprite_bbox_top;
	}
}

if (y - y_target < 0) {
	var t1 = tilemap_get_at_pixel(collision_tilemap, bbox_right, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(collision_tilemap, bbox_right, bbox_bottom) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0) {
		x = ((bbox_right & ~63) - 1) - sprite_bbox_right;
	}
	
} else {
	
	var t1 = tilemap_get_at_pixel(collision_tilemap, bbox_left, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(collision_tilemap, bbox_left, bbox_bottom) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0) {
		x = ((bbox_left + 64 ) & ~63) - sprite_bbox_left;
	}
}