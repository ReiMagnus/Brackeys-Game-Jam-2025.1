
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

global.dinheiro = 9999999;

// Fases bloqueados e desbloqueadas e estrelas das fases
info_fases = [ //[disponivel, estrelas]
    [true,  0],
    [false, 0],
    [false, 0],
    [false, 0],
    [false, 0],
];

// Informacao sobre itens desbloqueados e comprados
info_itens = [ // [disponivel, preco] // Depois adicionar um preco mais correto aos itens
    [true, 0, false, 9999], // Veiculos
    [true, 0, false, 100, false, 200, false, 300,], // Armas
    [true, 0, false, 100, false, 200]  // Equipamentos
];

// Veiculo
global.info_veiculo = {
    tipo  : 0, // qual veiculo
    arma0 : 1,
    arma1 : 3,
    arma2 : -1, 
    arma3 : -1,
    equip : 0
}

// Estatisticas guardadas 
global.info_estatisticas = {
    tempo : 0,
    dinhe : 0, // dinheiro
    jogos : 0, // Fases jogadas
    inimi : 0, // Inimigos mortos
}

global.info_init_fase = {
    
}

// Depois, mudar TODOS os textos para ingles
botoes_main     = ["JOGAR", "VEICULO", "OPCOES", "CREDITOS", "SAIR"];
botoes_jogar    = ["VOLTAR", "INICIAR"];
botoes_veiculo  = [ ["VEICULO", "ARMAMENTO", "EQUIPAMENTOS"], ["Van", "Veiculo02"], ["Pistola", "Metralhadora", "Pulse", "Cerra"], ["P.E.M", "Equipamento02", "Equipamento03"] ];
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

