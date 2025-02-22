
if (room = rm_Fase){
	// MOVIMENTAÇÃO
	if (movement = 0){ // pra traz
		qtd--;
		qtd = clamp(qtd,-2,aceleracao_max)
		x += -2 + round(qtd/2)
	}
	else{ // pra frente
        if(!audio_is_playing(sfx_veiculo_acelerar)) { play_sfx(sfx_veiculo_acelerar); } 
		qtd++;
		qtd = clamp(qtd,-2,aceleracao_max)
		x += 1 + round(qtd/2)
	}


	if (keyboard_check(vk_space)) { movement = 1 }
	else { movement = 0 }

	x = clamp(x,0,room_width-sprite_width) // limita movimento


	// Limitando a vida para 0
	global.veiculo_vida[0][0] = max(global.veiculo_vida[0][0], 0);
	global.veiculo_vida[1][0] = max(global.veiculo_vida[1][0], 0);
	global.veiculo_vida[2][0] = max(global.veiculo_vida[2][0], 0);

	// DEBUFFS DA VIDA
	if (global.veiculo_vida[0][0] <= 0){ 
		// aumenta tempo da fase
		if (!atras_debuff){
			obj_controle_fase.temp_fase += game_get_speed(gamespeed_fps)*15
			obj_controle_fase.temp_fase_total += game_get_speed(gamespeed_fps)*15
			atras_debuff = true
		}
	}

	if (global.veiculo_vida[1][0] <= 0){ 
		// mostra carga
		// é mostrado tecnicamente
	}

	if (global.veiculo_vida[2][0] <= 0){
		// piora aceleração
		aceleracao_max = 2
	}


	// ATIRAR

	// direção de cada arma em relação a parte
	dir_atras = point_direction(x+((sprite_width/3)/2),y+8,mouse_x,mouse_y);
	dir_frente = point_direction(x+(sprite_width/3)+((sprite_width/3)/2),y+8,mouse_x,mouse_y);
	dir_traseira = point_direction(x+8,y+64,mouse_x,mouse_y);

	// armas com tiro singular
	if (mouse_check_button_pressed(mb_left)){
		atirar_singular(0, x+((sprite_width/3)/2), y+8, dir_atras)
		atirar_singular(1, x+(sprite_width/3)+((sprite_width/3)/2), y+8, dir_frente)
	}

	// armas com tiro continuo
	if (mouse_check_button(mb_left)){
		atirar_continuo(0, x+((sprite_width/3)/2), y+8, dir_atras)
		atirar_continuo(1, x+(sprite_width/3)+((sprite_width/3)/2), y+8, dir_frente)
	}

	// armas passivas
	dano_passivo(0, x+((sprite_width/3)/2), y+8)
	dano_passivo(1, x+(sprite_width/3)+((sprite_width/3)/2), y+8)

	// cooldown depois de atirar, verifica a cada step
	atirar_cooldown(0)
	atirar_cooldown(1)
}
else{
	x += 2
}