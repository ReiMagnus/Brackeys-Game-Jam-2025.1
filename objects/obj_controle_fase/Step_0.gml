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
    
	if (temp_fase > 0){
		temp_fase--;
	}
	else{
		temp_fase = 0
		gameEnd = 0
	}
    
    // Criar inimigos na tela --------------------
    if(combate) {
        if(temp_spawn[0] <= 0) {
            var  _inimigos = [];
            array_copy(_inimigos, 0, inimigos, 0, 5);
            
            var _irandom  = irandom(99)-10;
            var _inimigo  = 0;
            
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
	
	
	// Usar equipamentos
	if (mouse_check_button_released(mb_right)){
		switch (veiculo_equip){
			case 0:
			play_sfx(sfx_equip_generico);
			with (obj_DroneBase) { instance_destroy() }
			break;
			
			case 1:
			play_sfx(sfx_equip_generico);
			var menor_v = 0
			for (var i = 0; i < 3; i++){
				if (global.veiculo_vida[i][0] < global.veiculo_vida[menor_v][0]){
					menor_v = i
				}
			}
			
			global.veiculo_vida[menor_v][0] = global.veiculo_vida[menor_v][1]
			break;
			
			case 2:
			play_sfx(sfx_equip_generico);
			dano_buff = 2
			alarm[0] = game_get_speed(gamespeed_fps)*30 // 30seg
			break;
		}
		veiculo_equip = -1
	}
	
}
