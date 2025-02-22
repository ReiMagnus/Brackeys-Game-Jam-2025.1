if(dps[0] <= 0) {
	var _parte = clamp(floor((x-obj_veiculo.x)/80), 0, 2)
	if (global.veiculo_vida[1][0] == 0){
		if (_parte != 1){
			global.veiculo_vida[_parte][2] = true
			obj_veiculo.alarm[_parte] = game_get_speed(gamespeed_fps)*0.1
			global.veiculo_vida[_parte][0] -= dano;
			dps[0] = dps[1];
		}
		else{
			obj_controle_fase.gameOver = 0
		}
	}
	else{
		global.veiculo_vida[_parte][2] = true
		obj_veiculo.alarm[_parte] = game_get_speed(gamespeed_fps)*0.1
		global.veiculo_vida[_parte][0] -= dano;
		dps[0] = dps[1];
	}
    
} else {dps[0]--;}
