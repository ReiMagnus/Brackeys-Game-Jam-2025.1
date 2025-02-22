// parallax
// vel de cada parte
background_map = ds_map_create();
background_map[? layer_get_id("Background_0")] = -4;
background_map[? layer_get_id("Background_1")] = -1;
background_map[? layer_get_id("Background_2")] = -0.8;
background_map[? layer_get_id("Background_3")] = -0.3;
background_map[? layer_get_id("Background_4")] = -0.2;


global.escala_janela = 2; // 1 = 640x360
global.musica = true;
global.sons = true;

enum abas_menu {
    main,
    jogar,
    veiculo,
    opcoes,
    creditos
}
menu_atual = abas_menu.main;
selecao = pointer_null
clickTime = 0 // doubleclick
aba_veiculo = 0; // Selecao para qual aba do menu veiculo o player esta

if (!variable_global_exists("dinheiro")){
	global.dinheiro = 9999999;
}

// Fases bloqueados e desbloqueadas e estrelas das fases
if (!variable_global_exists("info_fases")){
	global.info_fases = [ //[disponivel, estrelas]
	    [true,  0],
	    [false, 0],
	    [false, 0],
	    [false, 0],
	    [false, 0],
	];
}

// Informacao sobre itens desbloqueados e comprados
if (!variable_global_exists("info_itens")){
	global.info_itens = [ // [disponivel, preco] // Depois adicionar um preco mais correto aos itens
		[true, 0, false, 9999], // Veiculos
		[true, 0, false, 100, false, 200, false, 300,], // Armas
		[true, 0, false, 100, false, 200]  // Equipamentos
	];
}
	
// Veiculo
if (!variable_global_exists("info_veiculo")){
	global.info_veiculo = {
	    tipo  : 0, // qual veiculo
	    arma0 : 0,
	    arma1 : -1,
	    arma2 : -1, 
	    arma3 : -1,
	    equip : 0
	}
}

// Estatisticas guardadas 
if (!variable_global_exists("info_estatisticas")){
	global.info_estatisticas = {
	    tempo : 0,
	    dinhe : 0, // dinheiro
	    jogos : 0, // Fases jogadas
	    inimi : 0, // Inimigos mortos
	}
}

global.info_init_fase = {
    inimigos   : [20, 20, 20, 20, 20],
    temp_spawn : [0, 60], // [tempo_atual, tempo_padrap]
    temp_fase  : 0  // contagem por frames | 3600 = 1 minuto
	// usar game_get_speed(gamespeed_fps)
}

// Depois, mudar TODOS os textos para ingles
botoes_main     = ["JOGAR", "VEICULO", "OPCOES", "CREDITOS", "SAIR"];
botoes_jogar    = ["VOLTAR", "INICIAR"];
botoes_veiculo  = [ ["VEICULO", "ARMAMENTO", "EQUIPAMENTOS"], ["Van", "Veiculo02"], ["Pistola", "Metralhadora", "Pulse", "Cerra"], ["P.E.M", "Reparo Rapido", "Balas de Titanio"] ];
texto_lista     = "LISTA"; // :D 
botao_voltar    = "VOLTAR";
textos_creditos = " -Programacao-\nLeonardo Cordeiro (ReiMagnus)\nPaulo aaa (Xlender)\n\n" + 
                  "-Arte-\nPaulo aaa (Xlender)\n\n" + 
                  "-Musica e Sons-\nLeonardo Cordeiro (ReiMagnus)\n\n" +
                  "-Documento-\nLeonardo Cordeiro (ReiMagnus)\nPaulo aaa (Xlender)\n\n" +
                  "Jogo criado para o Brackeys Game Jam 2025.1";
texto_estatisticas = string(
    "Temmpo: {0}\nDinheiro ganho: {1}\nVezes jogadas: {2}\nInimigos mortos: {3}", 
    global.info_estatisticas.tempo, global.info_estatisticas.dinhe, global.info_estatisticas.jogos, global.info_estatisticas.inimi
);

#region Métodos para salvar e carregar jogo | Sara Spalding


function save_game() {
    
    //Maker save array
    var _saveData = array_create(0);
    
    // Informações para serem salvas no computador
    array_push(_saveData, global.dinheiro);
    array_push(_saveData, global.info_fases);
    array_push(_saveData, global.info_itens);
    array_push(_saveData, global.info_veiculo);
    array_push(_saveData, global.info_estatisticas);
    
    //turn all this data into a JSON string and save it via a buffer
    var _string = json_stringify(_saveData);
    var _buffer = buffer_create(string_byte_length(_string) +1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _string);
    buffer_save(_buffer, "savegame.save");
    buffer_delete(_buffer);
    
    show_debug_message("Game save!" + _string);
    
}

function load_game() {
    
    if(file_exists("savegame.save")) {
        
        var _buffer = buffer_load("savegame.save");
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);
        
        var _loadData = json_parse(_string);
        
        global.dinheiro          = _loadData[0];
        global.info_fases        = _loadData[1];
        global.info_itens		 = _loadData[2];
        global.info_veiculo      = _loadData[3];
        global.info_estatisticas = _loadData[4];
        
        show_debug_message("Game loaded! " + _string);
    }
    
}

function delete_save(){
	if (file_exists("savegame.save")){
		file_delete("savegame.save")
	}
}
#endregion
