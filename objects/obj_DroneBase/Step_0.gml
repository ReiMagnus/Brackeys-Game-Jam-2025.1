
var _alvox = obj_veiculo.x+120+mirax;
var _alvoy = obj_veiculo.y+60 ;

// Movimentação dos drones
var _dir_veiculo = point_direction(x, y, _alvox, _alvoy);
if(point_distance(x, y, _alvox, _alvoy) > range) {
    hsp = lengthdir_x(spd, _dir_veiculo);
    vsp = lengthdir_y(spd, _dir_veiculo);
    atirar = false;
    
    if(y >= 90 and tipo >= 3) {vsp = 0;}
} else {
    hsp = 0;
    vsp = 0;
    atirar = true;
}

image_xscale = x >= _alvox ? 1 : -1; //Direcao do olhar do drone

// Forma de atacar 
if(tipo < 3) { // Drones melee // poderia ser feito com switch, mas if pra ser melhor para oque eu quero fazer
    
    var _dist = point_distance(x, y, _alvox, _alvoy) < 10;
    if(_dist) {
        if(tipo == 2) { 
            if(recar[0] <= 0) {
                hsp = 0;
                vsp = 0;
                
                var _parte = clamp(floor((x-obj_veiculo.x)/80), 0, 2)
                global.veiculo_vida[_parte][0] -= dano;
                recar[0] = recar[1];
            } else {recar[0]--;}
        } else {
            var _parte = clamp(floor((x-obj_veiculo.x)/80), 0, 2)
            global.veiculo_vida[_parte][0] -= dano;
            instance_destroy();
        }
    }
} else { // Drones ranged
    
    if(atirar) {
        
        switch(tipo) {
            
            case 3 :
                if(recar[0] <= 0) {
                    var xx, yy;
                    xx = x-4;
                    yy = y+28;
                    
                    var _inst = instance_create_layer(xx, yy, "Drones", obj_BalaDrone);
                    _inst.dano = dano
                    _inst.speed = 4;
                    _inst.direction = point_direction(x, y, _alvox, _alvoy);
                    recar[0] = recar[1];
                } else {recar[0]--;}
                break;
            case 4 :
                if(recar[0] <= 0) {
                    var xx, yy; // Cano da arma do drone
                    xx = x-4;
                    yy = y+28;
                    
                    var _inst = instance_create_layer(xx, yy, "Drones", obj_FogoDrone);
                    _inst.dano = dano
                    _inst.image_angle = point_direction(x, y, _alvox, _alvoy)+90;
                    recar[0] = recar[1];
                } else {recar[0]--;}
                break; 
        }
    }
    
}



x += hsp;
y += vsp;