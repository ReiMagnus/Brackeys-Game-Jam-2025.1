if(!pause) {
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
    
    
    // Criar inimigos na tela --------------------
    if(combate) {
        if(temp_spawn[0] <= 0) {
            var  _inimigos = [];
            array_copy(_inimigos, 0, inimigos, 0, 5);
            
            var _irandom  = irandom(99)-10;
            var _inimigo  = 0;
            
            show_debug_message("----------")
            show_debug_message(_inimigos)
            
            while(_irandom > 0) {
                if(inimigos[_inimigo] != -1) {
                    if(_inimigos[_inimigo] <= 0) {_inimigo++;}
                    _irandom--;
                    _inimigos[_inimigo]--;
                } else {_inimigo++;}
            }
            
            //_inimigo = 2; // Inimigo fixo para testes
            
            var _xy_random = random(1);
            var _inst = instance_create_layer(path_get_x(spawn_drones, _xy_random), path_get_y(spawn_drones, _xy_random), "Drones", obj_DroneBase);
            _inst.tipo = _inimigo;
            
            temp_spawn[0] = temp_spawn[1];
        } else {
            temp_spawn[0]--;    
        }
    }
}
