if(dps[0] <= 0) {
    var _parte = clamp(floor((x-obj_veiculo.x)/80), 0, 2)
    global.veiculo_vida[_parte][0] -= dano;
    dps[0] = dps[1];
} else {dps[0]--;}
