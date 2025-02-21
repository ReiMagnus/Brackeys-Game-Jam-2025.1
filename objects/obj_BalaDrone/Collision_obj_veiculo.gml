var _parte = clamp(floor((x-obj_veiculo.x)/80), 0, 2)
global.veiculo_vida[_parte][0] -= dano;
instance_destroy();