
// parallax
var _cx = camera_get_view_x(view_camera[0]);
_cx += 2
camera_set_view_pos(view_camera[0], _cx, 0);

// vai um por um no background, mudando o x de acordo com a vel
var _b = ds_map_find_first(background_map)

repeat(ds_map_size(background_map)){
	layer_x(_b, background_map[? _b] * _cx)
	_b = ds_map_find_next(background_map, _b)
}