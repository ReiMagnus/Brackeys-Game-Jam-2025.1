
function atirar_singular(pos_arma_veiculo, arma_x, arma_y, dir){
	// PISTOLA
	if (global.veiculo_armas[pos_arma_veiculo][0] = 0){
		if (global.veiculo_armas[pos_arma_veiculo][1] == false){
			global.veiculo_armas[pos_arma_veiculo][1] = true
			global.veiculo_armas[pos_arma_veiculo][2] = global.info_armas[global.veiculo_armas[0][0]]
		
			var bala_x = arma_x + lengthdir_x(35, dir)
			var bala_y = arma_y + lengthdir_y(35, dir)

			var bala = instance_create_layer(bala_x,bala_y,"Balas",obj_bala_arma)
			bala.image_angle = dir
			bala.direction = dir
		}
	}
	// PULSE
	else if (global.veiculo_armas[pos_arma_veiculo][0] = 2){
		if (global.veiculo_armas[pos_arma_veiculo][1] == false){
			global.veiculo_armas[pos_arma_veiculo][1] = true
			global.veiculo_armas[pos_arma_veiculo][2] = global.info_armas[global.veiculo_armas[0][0]]
		
			var bala_x = arma_x + lengthdir_x(5, dir)
			var bala_y = arma_y + lengthdir_y(5, dir)

			var bala = instance_create_layer(bala_x,bala_y,"Balas",obj_bala_pulse)
			bala.image_angle = dir-90
		}
	}
}

function atirar_continuo(pos_arma_veiculo, arma_x, arma_y, dir){
	// METRALHADORA
	if (global.veiculo_armas[pos_arma_veiculo][0] = 1){
		if (global.veiculo_armas[pos_arma_veiculo][1] == false){
			global.veiculo_armas[pos_arma_veiculo][1] = true
			global.veiculo_armas[pos_arma_veiculo][2] = global.info_armas[global.veiculo_armas[1][0]]
			
			var bala_x = arma_x + lengthdir_x(42, dir-5)
			var bala_y = arma_y + lengthdir_y(42, dir-5)

			var bala = instance_create_layer(bala_x,bala_y,"Balas",obj_bala_arma)
			bala.image_angle = dir
			bala.direction = dir-1
			
			bala_x = arma_x + lengthdir_x(42, dir+5)
			bala_y = arma_y + lengthdir_y(42, dir+5)

			bala = instance_create_layer(bala_x,bala_y,"Balas",obj_bala_arma)
			bala.image_angle = dir
			bala.direction = dir+1
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