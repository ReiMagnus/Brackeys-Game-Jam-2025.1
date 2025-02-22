
function atirar_singular(pos_arma_veiculo, arma_x, arma_y, dir){
	// PISTOLA
	if (global.veiculo_armas[pos_arma_veiculo][0] = 0){
		if (global.veiculo_armas[pos_arma_veiculo][1] == false){
			global.veiculo_armas[pos_arma_veiculo][1] = true
			global.veiculo_armas[pos_arma_veiculo][2] = global.info_armas[global.veiculo_armas[pos_arma_veiculo][0]][0]
            
			var bala_x = arma_x + lengthdir_x(35, dir)
			var bala_y = arma_y + lengthdir_y(35, dir)
            
            play_sfx(sfx_arma_pistola);
			var bala = instance_create_layer(bala_x,bala_y,"Balas",obj_bala_arma)
			bala.image_angle = dir
			bala.direction = dir
			bala.dano = global.info_armas[global.veiculo_armas[pos_arma_veiculo][0]][1]
		}
	}
	// PULSE
	else if (global.veiculo_armas[pos_arma_veiculo][0] = 2){
		if (global.veiculo_armas[pos_arma_veiculo][1] == false){
			global.veiculo_armas[pos_arma_veiculo][1] = true
			global.veiculo_armas[pos_arma_veiculo][2] = global.info_armas[global.veiculo_armas[pos_arma_veiculo][0]][0]
		
			var bala_x = arma_x + lengthdir_x(5, dir)
			var bala_y = arma_y + lengthdir_y(5, dir)
            
            play_sfx(sfx_arma_pulse);
			var bala = instance_create_layer(bala_x,bala_y,"Balas",obj_bala_pulse)
			bala.image_angle = dir-90
			bala.dano = global.info_armas[global.veiculo_armas[pos_arma_veiculo][0]][1]
		}
	}
}

function atirar_continuo(pos_arma_veiculo, arma_x, arma_y, dir){
	// METRALHADORA
	if (global.veiculo_armas[pos_arma_veiculo][0] = 1){
		if (global.veiculo_armas[pos_arma_veiculo][1] == false){
			global.veiculo_armas[pos_arma_veiculo][1] = true
			global.veiculo_armas[pos_arma_veiculo][2] = global.info_armas[global.veiculo_armas[pos_arma_veiculo][0]][0]
			
			var bala_x = arma_x + lengthdir_x(42, dir-5)
			var bala_y = arma_y + lengthdir_y(42, dir-5)
            
            play_sfx(sfx_arma_metralhadora);
			var bala = instance_create_layer(bala_x,bala_y,"Balas",obj_bala_arma)
			bala.image_angle = dir
			bala.direction = dir-1
			
			bala_x = arma_x + lengthdir_x(42, dir+5)
			bala_y = arma_y + lengthdir_y(42, dir+5)
            
            play_sfx(sfx_arma_metralhadora);
			bala = instance_create_layer(bala_x,bala_y,"Balas",obj_bala_arma)
			bala.image_angle = dir
			bala.direction = dir+1
			bala.dano = global.info_armas[global.veiculo_armas[pos_arma_veiculo][0]][1]
		}
	}
}

function dano_passivo(pos_arma_veiculo, arma_x, arma_y){
	if (global.veiculo_armas[pos_arma_veiculo][0] = 3){
		if (global.veiculo_armas[pos_arma_veiculo][1] == false){
			global.veiculo_armas[pos_arma_veiculo][1] = true
			global.veiculo_armas[pos_arma_veiculo][2] = global.info_armas[global.veiculo_armas[pos_arma_veiculo][0]][0]
		
			var collision_box_y = (sprite_get_bbox_bottom(spr_arma_serra) - sprite_get_bbox_top(spr_arma_serra))
			var spr_width = sprite_get_width(spr_arma_serra)
			var spr_height = sprite_get_height(spr_arma_serra)
	
            if(!audio_is_playing(sfx_arma_serra)) { audio_play_sound(sfx_arma_serra, 5, true); } // Unico sfx com loop ----------- 
                
			draw_rectangle(arma_x - (spr_width/2), arma_y - (spr_height/2), arma_x - (spr_width/2) + (spr_width), arma_y - 24 + (collision_box_y), false)
	       
			var inst = collision_rectangle(arma_x - (spr_width/2), arma_y - (spr_height/2), arma_x - (spr_width/2) + (spr_width), arma_y - 24 + (collision_box_y), obj_DroneBase, true, false)	
	
			if (inst != noone){
				inst.life -= global.info_armas[global.veiculo_armas[pos_arma_veiculo][0]][1]
			}
		}
	}
}

// COOLDOWN para depois que atirar
function atirar_cooldown(pos_arma_veiculo){
	if (global.veiculo_armas[pos_arma_veiculo][2] >= 0){
	global.veiculo_armas[pos_arma_veiculo][2]--
	}
	else{
		global.veiculo_armas[pos_arma_veiculo][1] = false
		global.veiculo_armas[pos_arma_veiculo][2] = 0
	}	
}