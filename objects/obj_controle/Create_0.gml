
// resize janela
window_set_size(1280,720)

// parallax
// vel de cada parte
background_map = ds_map_create();
background_map[? layer_get_id("Background_0")] = -4;
background_map[? layer_get_id("Background_1")] = -1;
background_map[? layer_get_id("Background_2")] = -0.8;
background_map[? layer_get_id("Background_3")] = -0.3;
background_map[? layer_get_id("Background_4")] = -0.2;

global.ds_veiculo_vida = ds_grid_create(3,2)

// 0 - atras / 1 - meio / 2 - frente

ds_grid_add(global.ds_veiculo_vida,0,0,20) // vida atual
ds_grid_add(global.ds_veiculo_vida,0,1,50) // vida max

ds_grid_add(global.ds_veiculo_vida,1,0,50)
ds_grid_add(global.ds_veiculo_vida,1,1,50)

ds_grid_add(global.ds_veiculo_vida,2,0,30)
ds_grid_add(global.ds_veiculo_vida,2,1,50)

// ainda é preciso colocar os efeitos se a vida ficar 0
