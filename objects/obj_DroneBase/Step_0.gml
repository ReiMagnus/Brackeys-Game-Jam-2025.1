
if (life <= 0){ 
	switch(tipo) {
	    case 0: 
		global.dinhe_total += 2
		break;
		
	    case 1: 
		global.dinhe_total += 10
	    break;
		
	    case 2: 
		global.dinhe_total += 5
	    break;
		
	    case 3: 
		global.dinhe_total += 12
	    break;
		
	    case 4: 
		global.dinhe_total += 15
	    break;
	}
	
	global.inimigo_total++;
	instance_destroy(self) 
}


var _alvox = obj_veiculo.x+120+mirax;
var _alvoy = obj_veiculo.y+60 ;

// Movimentação dos drones
var _dir_veiculo = point_direction(x, y, _alvox, _alvoy);
if(point_distance(x, y, _alvox, _alvoy) > range) {
    hsp = lengthdir_x(spd, _dir_veiculo);
    vsp = lengthdir_y(spd, _dir_veiculo);
    atirar = false;
    
    if(y >= 90 and tipo == 3) {vsp = 0;}
	
	if(y >= 180 and tipo == 3) {vsp = 0;}
} else {
    hsp = 0;
    vsp = 0;
    atirar = true;
}

image_xscale = x >= _alvox ? 1 : -1; //Direcao do olhar do drone

// Forma de atacar 
if(tipo < 3) { // Drones melee // poderia ser feito com switch, mas if pra ser melhor para oque eu quero fazer
    var _dist = point_distance(x, y, _alvox, _alvoy) < 20;

	var _dist_tooclose = point_distance(x, y, _alvox, _alvoy) < 25;
	var _dist_realclose = point_distance(x, y, _alvox, _alvoy) < 30;
	var _dist_close = point_distance(x, y, _alvox, _alvoy) < 80;
	var _dist_mid = point_distance(x, y, _alvox, _alvoy) < 150;
	
    if(_dist) {
        if(tipo == 2) { 
			image_speed = 1
            if(recar[0] <= 0) {
                hsp = 0;
                vsp = 0;
                
				play_sfx(sfx_drone_espinho);
                var _parte = clamp(floor((x-obj_veiculo.x)/80), 0, 2)
                global.veiculo_vida[_parte][0] -= dano;
				global.veiculo_vida[_parte][2] = true
				obj_veiculo.alarm[_parte] = game_get_speed(gamespeed_fps)*0.1
                recar[0] = recar[1];
            } else {recar[0]--;}
        } else {
			var _parte = clamp(floor((x-obj_veiculo.x)/80), 0, 2)
			global.veiculo_vida[_parte][0] -= dano;
			global.veiculo_vida[_parte][2] = true
			obj_veiculo.alarm[_parte] = game_get_speed(gamespeed_fps)*0.1
			instance_destroy()
        }
    }
	else{
		if(tipo == 2) { 
			image_speed = 0	
		}
	}
	
	if(tipo == 0) { 
		if (_dist_mid){
			image_index = 1		
			if (_dist_close){
				image_index = 2
				if (_dist_realclose){
					image_index = 3
					image_blend = c_white
					if (_dist_tooclose){
						image_blend = c_orange
					}
				}
			}
		}
	}
	else if (tipo == 1){
		if (_dist_realclose){
			image_blend = c_orange
		}
		else{
			image_blend = c_white	
		}
	}
	
	
} else { // Drones ranged
    
    if(atirar) {
		image_index = 1
        
        switch(tipo) {
            
            case 3 :
                if(recar[0] <= 0) {
                    var xx, yy;
                    xx = x-4;
                    yy = y+28;
                    
					play_sfx(sfx_drone_tiro);
                    var _inst = instance_create_layer(xx, yy, "Drones", obj_BalaDrone);
                    _inst.dano = dano
                    _inst.speed = 4;
                    _inst.direction = point_direction(x, y, _alvox, _alvoy);
					_inst.image_angle = point_direction(x, y, _alvox, _alvoy);
					image_index = 0
                    recar[0] = recar[1];
                } else {recar[0]--;}
                break;
            case 4 :
                if(recar[0] <= 0) {
                    var xx, yy; // Cano da arma do drone
                    xx = x-4;
                    yy = y+28;
                    
					play_sfx(sfx_drone_fogo);
					var _teste = instance_create_layer(xx, yy, "Drones", obj_bala_lancachama);
					_teste.speed = 3;
                    _teste.direction = point_direction(x, y, _alvox, _alvoy);
					_teste.dano = dano
					_teste.image_angle = point_direction(x, y, _alvox, _alvoy)+90;
					_teste.image_angle = point_direction(x, y, _alvox, _alvoy)+90;
					recar[0] = recar[1];
					
                    /*var _inst = instance_create_layer(xx, yy, "Drones", obj_FogoDrone);
                    _inst.dano = dano
                    _inst.image_angle = point_direction(x, y, _alvox, _alvoy)+90;
					_inst.image_angle = point_direction(x, y, _alvox, _alvoy)+90;*/
                    
                } else {recar[0]--;}
                break; 
        }
    }
    
}


if (!stop_move){
	x += hsp;
	y += vsp;
}