
randomize()

play_music();

// Paramentros da fase ------------
inimigos		= global.info_init_fase.inimigos;
temp_spawn		= global.info_init_fase.temp_spawn;
temp_fase		= global.info_init_fase.temp_fase;
fase			= global.info_init_fase.fase
temp_fase_total = global.info_init_fase.temp_fase

global.dinhe_total		= 0
global.inimigo_total	= 0

combate = true; // ligar/desligar o spawn dos drones
spawn_drones = pth_SpawnDrones;

// Menu Pause ---------
pause = false;
pauseSurf = -1;
pauseSurfBuffer = -1;

gameOver = -1
gameEnd = -1

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

veiculo_equip = global.info_veiculo.equip
dano_buff = 1

// tempo tiro
global.info_armas = [ 
	[game_get_speed(gamespeed_fps)*0.2, 6], // pistola
	[game_get_speed(gamespeed_fps)*0.1, 2], // metralhadora
	[game_get_speed(gamespeed_fps)*3, 20], // pulse
	[game_get_speed(gamespeed_fps)*0.4, 15] // serra
];

// VAN
if global.info_veiculo.tipo = 0{
	global.veiculo_vida = [ // [vida atual, vida max, sinalização de dano]
		[50, 50, false], // atras
		[50, 50, false], // meio
		[50, 50, false]  // frente
	];

	global.veiculo_armas = [ // [tipo de arma, status, timer]
		[global.info_veiculo.arma0, false, 0],
		[global.info_veiculo.arma1, false, 0],
	];
}