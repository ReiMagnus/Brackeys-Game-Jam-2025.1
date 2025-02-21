randomize()

// Paramentros da fase ------------
inimigos   = global.info_init_fase.inimigos;
temp_spawn = global.info_init_fase.temp_spawn;
temp_fase  = global.info_init_fase.temp_fase;


combate = true; // ligar/desligar o spawn dos drones
spawn_drones = pth_SpawnDrones;

// Menu Pause ---------
pause = false;
pauseSurf = -1;
pauseSurfBuffer = -1;

resW = 640* global.escala_janela;
resH = 360* global.escala_janela

// resize janela
// window_set_size(1280,720) // acho que essa parte não precisa mais
window_center();

// parallax
// vel de cada parte
background_map = ds_map_create();
background_map[? layer_get_id("Background_0")] = -4;
background_map[? layer_get_id("Background_1")] = -1;
background_map[? layer_get_id("Background_2")] = -0.8;
background_map[? layer_get_id("Background_3")] = -0.3;
background_map[? layer_get_id("Background_4")] = -0.2;

global.veiculo_vida = [ // [vida atual, vida max]
	[20, 50], // atras
	[20, 50], // meio
	[20, 50]  // frente
];

global.veiculo_armas = [ // [tipo de arma, status, timer]
	[2, false, 0], 
	[1, false, 0],
];

// status se esta atirando ou n
global.info_armas = [ 
	game_get_speed(gamespeed_fps)*0.2, 
	game_get_speed(gamespeed_fps)*0.1,
	game_get_speed(gamespeed_fps)*3 
];
