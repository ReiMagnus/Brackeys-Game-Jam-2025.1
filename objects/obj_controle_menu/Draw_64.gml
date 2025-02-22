// conserta gui da fase
display_set_gui_size(640*2, 360*2);

// Posição do mouse na janela
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Tamanho atual da janela
var _wgui = display_get_gui_width();
var _hgui = display_get_gui_height();

switch(menu_atual) {
    
    case abas_menu.main :
        
        // Congiguração do texto da tela
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        draw_set_font(fnt_BotoesMenu); // Fonte Botões Menu ///Pode mudar para uma fonte personalizada depois
        
        draw_text_transformed(40, _hgui*0.20, "NOME DO JOGO", 6, 6, 0); // Futuramente isso será o sprite
        
        var xx, yy, x1, y1, x2, y2;
        
        for(var i = 0; i < array_length(botoes_main); i++) {
            
            var _wstr = string_width(botoes_main[i]) * global.escala_janela;
            var _hstr = string_height(botoes_main[i]) * global.escala_janela;
            
            xx = 40;
            yy = _hgui*0.45 + (32 * i * global.escala_janela);
            
            x1 = xx - _wstr*0.01;
            y1 = yy - _hstr*0.45;
            x2 = xx + _wstr*1.01;
            y2 = yy + _hstr*0.45;
            
            if(point_in_rectangle(_mx, _my, x1, y1, x2, y2)) {
                if(mouse_check_button_released(mb_left)) {
                    switch(i) {
                        case 0 : menu_atual = abas_menu.jogar; break; // JOGAR
                        case 1 : menu_atual = abas_menu.veiculo; break; // VEICULO
                        case 2 : menu_atual = abas_menu.opcoes; break; // OPCOES
                        case 3 : menu_atual = abas_menu.creditos; break; // CREDITOS
                        case 4 : // SAIR
                            // método para salvar o jogo
                            game_end();
                            break;
                    }
                    selecao = pointer_null;
                }
            }
            
            //draw_rectangle(x1, y1, x2, y2, 1); // Area de colisão dos botões
			draw_text_transformed_outlined(xx, yy, c_black, c_white, botoes_main[i], global.escala_janela, global.escala_janela);
        }
        break;
        
    case abas_menu.jogar :
        
        draw_sprite_ext(spr_map, 0, 0, 0, global.escala_janela, global.escala_janela, 0, c_white, 1);
        
        var xx, yy, x1, y1, x2, y2;
        
        var _total_fases = 5;
        for (var i = 0; i < _total_fases; i++) { // Seleçao de fases
            switch(i) {
                case 0 : xx = 29; yy = 48; break;
                case 1 : xx = 130; yy = 131; break;
                case 2 : xx = 288; yy = 56; break;
                case 3 : xx = 399; yy = 132; break;
                case 4 : xx = 557; yy = 64; break;
            }
            xx *= global.escala_janela;
            yy *= global.escala_janela;
            
            x1 = xx;
            y1 = yy;
            x2 = xx + (50 * global.escala_janela);
            y2 = yy + (50 * global.escala_janela);
            
			// conferir se ja jogaram na fase
			var visitado = 0
			if(global.info_fases[i][1] > 0) { visitado = 2; }
			
            // Selecioando a fase
            if(point_in_rectangle(_mx, _my, x1, y1, x2, y2)) { if(mouse_check_button_released(mb_left) and global.info_fases[i][0] == true) { selecao = i; } }
			
            //var _selecao = i == selecao ? 1 : 0;

			draw_set_halign(fa_center);
            draw_set_font(fnt_BotoesMenu);
			
            // Desenahando os botões na tela
            // draw_rectangle(x1, y1, x2, y2, 1); desenhando a colisão do botão
			
			// desenhar fase icones e descricao
			switch (i){
				case 0:
				if (selecao != i){ draw_sprite_ext(spr_map_l1, 0+visitado, xx, yy, global.escala_janela, global.escala_janela, 0, c_white, 1); }
				else {
					draw_sprite_ext(spr_map_l1, 1+visitado, xx, yy, global.escala_janela, global.escala_janela, 0, c_white, 1)
					draw_text_ext_transformed(_wgui/2, _hgui/2+196, "descricao descricao descricao descricao descricao descricao descricao descricao descricao descricao1", 24, 400, global.escala_janela, global.escala_janela, 0);
				}
				break;
				
				case 1:
				if (selecao != i){ draw_sprite_ext(spr_map_l2, 0+visitado, xx, yy, global.escala_janela, global.escala_janela, 0, c_white, 1); }
				else {
					draw_sprite_ext(spr_map_l2, 1+visitado, xx, yy, global.escala_janela, global.escala_janela, 0, c_white, 1)
					draw_text_ext_transformed(_wgui/2, _hgui/2+196, "descricao descricao descricao descricao descricao descricao descricao descricao descricao descricao2", 24, 400, global.escala_janela, global.escala_janela, 0);
				}
				break;
				
				case 2:
				if (selecao != i){ draw_sprite_ext(spr_map_l3, 0+visitado, xx, yy, global.escala_janela, global.escala_janela, 0, c_white, 1); }
				else {
					draw_sprite_ext(spr_map_l3, 1+visitado, xx, yy, global.escala_janela, global.escala_janela, 0, c_white, 1)
					draw_text_ext_transformed(_wgui/2, _hgui/2+196, "descricao descricao descricao descricao descricao descricao descricao descricao descricao descricao3", 24, 400, global.escala_janela, global.escala_janela, 0);
				}
				break;
				
				case 3:
				if (selecao != i){ draw_sprite_ext(spr_map_l4, 0+visitado, xx, yy, global.escala_janela, global.escala_janela, 0, c_white, 1); }
				else {
					draw_sprite_ext(spr_map_l4, 1+visitado, xx, yy, global.escala_janela, global.escala_janela, 0, c_white, 1)
					draw_text_ext_transformed(_wgui/2, _hgui/2+196, "descricao descricao descricao descricao descricao descricao descricao descricao descricao descricao4", 24, 400, global.escala_janela, global.escala_janela, 0);
				}
				break;
				
				case 4:
				if (selecao != i){ draw_sprite_ext(spr_map_l5, 0+visitado, xx, yy, global.escala_janela, global.escala_janela, 0, c_white, 1); }
				else {
					draw_sprite_ext(spr_map_l5, 1+visitado, xx, yy, global.escala_janela, global.escala_janela, 0, c_white, 1)
					draw_text_ext_transformed(_wgui/2, _hgui/2+196, "descricao descricao descricao descricao descricao descricao descricao descricao descricao descricao5", 24, 400, global.escala_janela, global.escala_janela, 0);
				}
				break;
			}
			
			if (selecao != pointer_null){
				var nivel = selecao+1
				var stars_width = (sprite_get_width(spr_stars))
				
				// fase nome
				draw_text_transformed(_wgui/2-120, _hgui/2+128, "Fase " + string(nivel), global.escala_janela, global.escala_janela, 0);
					
				// desenhar estrelas
				for (var j = -1; j < 2; j++){
					if ((j+1) < global.info_fases[selecao][1]) { draw_sprite_ext(spr_stars, 1, (_wgui/2) + 100 - stars_width + j*(stars_width+16), (_hgui/2)+100, global.escala_janela, global.escala_janela, 0, c_white, 1) }
					else { draw_sprite_ext(spr_stars, 0,(_wgui/2) + 100 - stars_width + j*(stars_width+16), (_hgui/2)+100, global.escala_janela, global.escala_janela, 0, c_white, 1) }
				}
			}
					
            //draw_sprite_ext(spr_Botoes, i*2+_selecao, xx, yy, global.escala_janela, global.escala_janela, 0, c_white, 1);
        }
            
            
           draw_set_valign(fa_bottom);
           draw_set_font(fnt_BotoesMenu); // Fonte Botões Menu ///Pode mudar para uma fonte personalizada depois
            
        for(var i = 0; i < array_length(botoes_jogar); i++) { // Botões do menu
            
            var _wstr = string_width(botoes_jogar[i]) * global.escala_janela;
            var _hstr = string_height(botoes_jogar[i]) * global.escala_janela;
            
            xx = (8 * global.escala_janela) + (_wgui-(16*global.escala_janela))*i;
            yy = _hgui - (8*global.escala_janela);
            
            y1 = yy - _hstr;
            y2 = yy;
            if(i == 0) {  // tá feio, mas ta funcionando
                x1 = xx;
                x2 = xx + _wstr;
                draw_set_halign(fa_left); 
            } else { 
                x1 = xx - _wstr;
                x2 = xx;
                draw_set_halign(fa_right); 
            }    
            
            if(point_in_rectangle(_mx, _my, x1, y1, x2, y2)) {
                if(mouse_check_button_released(mb_left)) { 
                    switch (i) {
                        case 0 : menu_atual = abas_menu.main; break; // VOLTAR
                        case 1 : 
						// settar info para fase que entrar
						switch (selecao+1){
							case 1:
							global.info_init_fase.inimigos = [20, 20, 20, 20, 20]
							global.info_init_fase.temp_spawn = [0, 60]
							global.info_init_fase.temp_fase = game_get_speed(gamespeed_fps)*10 // 10 sec
							break;
							
							case 2:
							global.info_init_fase.inimigos = [-1, -1, -1, -1, -1]
							global.info_init_fase.temp_spawn = [0, 0]
							global.info_init_fase.temp_fase = game_get_speed(gamespeed_fps)*12
							break;
							
							case 3:
							global.info_init_fase.inimigos = [-1, -1, -1, -1, -1]
							global.info_init_fase.temp_spawn = [0, 0]
							global.info_init_fase.temp_fase = game_get_speed(gamespeed_fps)*43
							break;
							
							case 4:
							global.info_init_fase.inimigos = [-1, -1, -1, -1, -1]
							global.info_init_fase.temp_spawn = [0, 0]
							global.info_init_fase.temp_fase = game_get_speed(gamespeed_fps)*87
							break;
							
							case 5:
							global.info_init_fase.inimigos = [-1, -1, -1, -1, -1]
							global.info_init_fase.temp_spawn = [0, 0]
							global.info_init_fase.temp_fase = game_get_speed(gamespeed_fps)*100
							break;						
						}
						
						global.info_init_fase.fase = selecao+1
						room_goto(rm_Fase) 
						break; // Metodo para enviar para a fase com os parametros certos ---------------------------------------------------
                    }
                } 
            }
            
            // Desenahando os botões na tela
            // draw_rectangle(x1, y1, x2, y2, 1); desenhando a colisão do botão
            draw_text_transformed(xx, yy, botoes_jogar[i], global.escala_janela, global.escala_janela, 0);
        }
        
        break;
        
    case abas_menu.veiculo :
        
        draw_sprite_ext(spr_MenuVeiculo, 0, 0, 0, global.escala_janela, global.escala_janela, 0, c_white, 1);
        
        draw_set_font(fnt_TextosHUD);
        
        var xx, yy, x1, y1, x2, y2;
        
        // Veiculo --------------------------------------------------
        xx = (_wgui/8)*3;
        yy = (_hgui/8)*5.8;
        
        draw_sprite_ext(spr_VeiculoHUD, 0, xx, yy, global.escala_janela, global.escala_janela, 0, c_white, 1);
        
        // Equipamento ---
        yy = (_hgui/8)*7;
        
        draw_text_transformed(xx, yy, botoes_veiculo[3][global.info_veiculo.equip], global.escala_janela, global.escala_janela, 0);
        
        // Desenhando as armas
        for(var i = 0; i < 2; i++) {
            
            var _armas = [spr_arma_base_menu, spr_arma_pistola_menu, spr_arma_metralhadora_menu, spr_arma_pulse_menu, spr_arma_serra_menu];
            var _arma;
            
             yy = (_hgui/8)*5.8 - (101 * global.escala_janela); // xx e yy feito para apenas um tipo de veiculo, mudar isso para uma versão futura
            
            switch(i) {
                case 0 : _arma = _armas[global.info_veiculo.arma0+1]; xx = (_wgui/8)*3 - (81 * global.escala_janela); break;
                case 1 : _arma = _armas[global.info_veiculo.arma1+1]; xx = (_wgui/8)*3; break;
                case 2 : _arma = _armas[global.info_veiculo.arma2+1]; break;
                case 3 : _arma = _armas[global.info_veiculo.arma3+1]; break;
            }
            
            
            // Trocando o armamento do veiculo ---
            if(selecao != pointer_null) {
                
                var _wspr = sprite_get_width(_arma) * global.escala_janela;
                var _hspr = sprite_get_height(_arma) * global.escala_janela;
                
                x1 = xx - _wspr/2;
                y1 = yy - _hspr;
                x2 = xx + _wspr/2;
                y2 = yy;
                
                if(point_in_rectangle(_mx, _my, x1, y1, x2, y2)) {
                    
                    if(mouse_check_button_released(mb_right)) {selecao = pointer_null;}
                    
                    if(mouse_check_button_released(mb_left)) {
                        
                        switch(i) {
                            case 0 : 
                                if(global.info_veiculo.arma1 == selecao) {global.info_veiculo.arma1 = -1;}
                                global.info_veiculo.arma0 = selecao; 
                                break;
                            case 1 : 
                                if(global.info_veiculo.arma0 == selecao) {global.info_veiculo.arma0 = -1;}
                                global.info_veiculo.arma1 = selecao; 
                                break;
                            case 2 : 
                                // global.info_veiculo.arma2 = selecao; // nao precisa pra essa demo
                                break;
                            case 3 : 
                                // global.info_veiculo.arma4 = selecao; // nao precisa pra essa demo
                                break;
                        }
                        selecao = pointer_null;
                    }
                }
                draw_rectangle(x1, y1, x2, y2, 1); // desenhando a colisao do botao
            }
            
            // Desenhando as armas do veiculo
            draw_sprite_ext(_arma, 0, xx, yy, global.escala_janela, global.escala_janela, 0, c_white, 1);
        }
        
        //Dinheiro ---
        draw_set_halign(fa_right);
        draw_set_valign(fa_bottom);
        
        xx = (_wgui/8)*5.9;
        yy = (_hgui/8)*7.9;
        
        draw_text_transformed(xx, yy, string("${0}", global.dinheiro), global.escala_janela, global.escala_janela, 0);
        
        #region Botao VOLTAR ---
        draw_set_halign(fa_left);
        draw_set_font(fnt_BotoesMenu);
        var _wstr = string_width(botao_voltar) * global.escala_janela;
        var _hstr = string_height(botao_voltar) * global.escala_janela;
        
        xx = (_wgui/8)*0.1;
        yy = (_hgui/8)*7.9;
        
        x1 = xx;
        y1 = yy - _hstr;
        x2 = xx + _wstr;
        y2 = yy;
        
        if(point_in_rectangle(_mx, _my, x1, y1, x2, y2)) { if(mouse_check_button_released(mb_left)) {menu_atual = abas_menu.main; selecao = pointer_null; save_game();} }
        
        // draw_rectangle(x1, y1, x2, y2, 1); // desenhando a colisao do botao
        draw_text_transformed(xx, yy, "VOLTAR", global.escala_janela, global.escala_janela, 0);
        #endregion
        
        
        // Abas -----------------------------------------------------
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(fnt_TextosHUD);
        
        for(var i = 0; i < array_length(botoes_veiculo[0]); i++) {
            
            xx = (_wgui/8)*1 + ((_wgui/8)*2)*i;
            yy = (_hgui/8)*0.5;
            
            x1 = xx - (_wgui/8-1);
            y1 = yy - (_hgui/8/2-1);
            x2 = xx + (_wgui/8-2);
            y2 = yy + (_hgui/8/2-2);
            
            if(point_in_rectangle(_mx,  _my, x1, y1, x2, y2)) {
                if(mouse_check_button_released(mb_left)) {
                    draw_rectangle_color(x1, y1, x2, y2, c_white, c_white, c_white, c_white, 0); // Piscar aba selecionada
                    aba_veiculo = i;
                    selecao = pointer_null;
                }
            }
            
            draw_rectangle(x1, y1, x2, y2, 1); // desenhando a colisao do botao
            draw_text_transformed(xx, yy, botoes_veiculo[0][i], global.escala_janela, global.escala_janela, 0);
            
        }
        
        // Itens ----------------------------------------------------
        var _itens = array_length(botoes_veiculo[aba_veiculo+1]);
        
        for (var i = 0; i < _itens; i++) {
            
            draw_text_transformed((_wgui/8)*7, (_hgui/8)*0.5, texto_lista, global.escala_janela, global.escala_janela, 0);
            
            xx = (_wgui/8)*7;
            yy = (_hgui/8)*1.5 + ((_hgui/8)*1)*i;
            
            x1 = xx - (_wgui/8-1);
            y1 = yy - (_hgui/8/2-1);
            x2 = xx + (_wgui/8-1);
            y2 = yy + (_hgui/8/2-2);
            
            if(point_in_rectangle(_mx,  _my, x1, y1, x2, y2)) {
				
				draw_set_halign(fa_left)
				draw_set_valign(fa_top)
				
				// DESCRIÇÃO 
				if (aba_veiculo == 0){
					switch (i){
						case 0:
						draw_text_ext_transformed((_wgui/8)*4,(_hgui/8) + 6, "Descricao carro 1.",16,(_wgui/8)-6, global.escala_janela, global.escala_janela, 0)
						break;
						
						case 1:
						draw_text_ext_transformed((_wgui/8)*4,(_hgui/8) + 6, "Descricao carro 2.",16,(_wgui/8)-6, global.escala_janela, global.escala_janela, 0)
						break;
					}
				}
				else if (aba_veiculo == 1){
					switch (i){
						case 0:
						draw_text_ext_transformed((_wgui/8)*4,(_hgui/8) + 6, "pistola.",16,(_wgui/8)-6, global.escala_janela, global.escala_janela, 0)
						break;
						
						case 1:
						draw_text_ext_transformed((_wgui/8)*4,(_hgui/8) + 6, "metralhadora.",16,(_wgui/8)-6, global.escala_janela, global.escala_janela, 0)
						break;
						
						case 2:
						draw_text_ext_transformed((_wgui/8)*4,(_hgui/8) + 6, "pulse",16,(_wgui/8)-6, global.escala_janela, global.escala_janela, 0)
						break;
						
						case 3:
						draw_text_ext_transformed((_wgui/8)*4,(_hgui/8) + 6, "serra",16,(_wgui/8)-6, global.escala_janela, global.escala_janela, 0)
						break;
					}
				}
                else if (aba_veiculo == 2){
					switch (i){
						case 0:
						draw_text_ext_transformed((_wgui/8)*4,(_hgui/8) + 6, "epm",16,(_wgui/8)-6, global.escala_janela, global.escala_janela, 0)
						break;
						
						case 1:
						draw_text_ext_transformed((_wgui/8)*4,(_hgui/8) + 6, "outro eqp",16,(_wgui/8)-6, global.escala_janela, global.escala_janela, 0)
						break;
						
						case 2:
						draw_text_ext_transformed((_wgui/8)*4,(_hgui/8) + 6, "outro outro eqp",16,(_wgui/8)-6, global.escala_janela, global.escala_janela, 0)
						break;
					}
				}
				draw_set_halign(fa_center)
				draw_set_valign(fa_middle)
				
				if(mouse_check_button_released(mb_left)) {
                    
                    if(global.info_itens[aba_veiculo][i*2] && clickTime == -1) { // Verificando se está disponivel ou não
                        
                        switch(aba_veiculo) {
                            case 0 : if(i == 1) {show_message("ERROR");} break; // Veiculo
                            // Existe a opção de comprar o proximo veiculo, mas se o player comprar e selecionar, irá mostrar uma mensagem de aviso não tem o veiculo
                            
                            case 1 : selecao = i; break; // Armamentos
                            
                            case 2: global.info_veiculo.equip = i; break; // Equipamento
                            
                        }
                        draw_rectangle_color(x1, y1, x2, y2, c_white, c_white, c_white, c_white, 0);
                    } 
                }
				
				// comprando item
				if(mouse_check_button(mb_left)) {
					if(!global.info_itens[aba_veiculo][i*2]) { // Verificando se está disponivel ou não
						if (clickTime == - 1) { clickTime = 0 }
						
                        clickTime+=6;
						
						draw_rectangle_color(x1, y1, x1+clickTime, y2, c_white, c_white, c_white, c_white, 0);
						
                        if(global.info_itens[aba_veiculo][i*2+1] < global.dinheiro) { 
							if clickTime >= (x2 - x1){
								global.dinheiro -= global.info_itens[aba_veiculo][i*2+1]; 
								global.info_itens[aba_veiculo][i*2] = true;
								clickTime = 0
							}
						}
                    }
				}
				else{
					clickTime = -1	
				}
            }
            
            draw_rectangle(x1, y1, x2, y2, 1);
            
            var _string = global.info_itens[aba_veiculo][i*2] ? botoes_veiculo[aba_veiculo+1][i] : string("X  ${0}",  global.info_itens[aba_veiculo][i*2+1]);
            draw_text_transformed(xx, yy, _string, global.escala_janela, global.escala_janela, 0);
            
        }
        break;
        
    case abas_menu.opcoes :
        
        draw_sprite_ext(spr_FundoPreto, 0, 0, 0, global.escala_janela, global.escala_janela, 0, c_white, 0.25); // Escurecendo a tela
        
        var xx, yy, x1, y1, x2, y2;
        
        var _total_opcoes = 2; // Quantos opções vai ter no menu
        var _tam = 45 * global.escala_janela;
        var _esp = 20 * global.escala_janela;
        var _total = (_tam*2)*_total_opcoes + _esp*(_total_opcoes-1)
          
        
        for(var i = 0; i < _total_opcoes; i++) {
            xx = ((_wgui/2-_total/2) + _tam) + ((_tam*2+_esp)*i);
            yy = _hgui*0.25;
            
            x1 = xx - _tam;
            y1 = yy - _tam;
            x2 = xx + _tam;
            y2 = yy + _tam;
            
            if(point_in_rectangle(_mx, _my, x1, y1, x2, y2)) {
                if(mouse_check_button_released(mb_left)) {
                    switch(i) {
                        case 0 : global.musica = global.musica == true ? false : true; break; // Musíca
                        case 1 : global.sons = global.sons == true ? false : true; break; // Som
                        // case 2 : global.musica = global.musica == true ? false : true; break; // Tamanho janela
                    }
                }
            }
            
            // Draws temporarios
            if(i == 0) {draw_text(xx-25, yy, string("Musica: {0}", global.musica));} else
            if(i == 1) {draw_text(xx-25, yy, string("Sons: {0}", global.sons));}
            
            draw_rectangle(x1, y1, x2, y2, 1);
        }
        
        #region Estatisticas 
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        
        xx = _wgui/2;
        yy = (45*5)*global.escala_janela;
        
        draw_text_transformed(xx, yy, texto_estatisticas, global.escala_janela, global.escala_janela, 0);
        #endregion
        
        #region Botao VOLTAR
        draw_set_font(fnt_BotoesMenu);
        var _wstr = string_width(botao_voltar) * global.escala_janela;
        var _hstr = string_height(botao_voltar) * global.escala_janela;
        
        xx = _wgui/2;
        yy = (45*7.4)*global.escala_janela;
        
        x1 = xx - _wstr/2;
        y1 = yy - _hstr/2;
        x2 = xx + _wstr/2;
        y2 = yy + _hstr/2;
        
        if(point_in_rectangle(_mx, _my, x1, y1, x2, y2)) { if(mouse_check_button_released(mb_left)) {menu_atual = abas_menu.main;} }
        
        // draw_rectangle(x1, y1, x2, y2, 1); desenhando a colisao do botao
        draw_text_transformed(xx, yy, "VOLTAR", global.escala_janela, global.escala_janela, 0);
        #endregion
        
        break;
        
    case abas_menu.creditos :
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        
        var xx, yy, x1, y1, x2, y2;
        
        xx = _wgui*0.5;
        yy = _hgui*0.45;
        
        draw_text_transformed(xx, yy, textos_creditos, global.escala_janela, global.escala_janela, 0);
        
        #region Botao VOLTAR
        draw_set_font(fnt_BotoesMenu);
        var _wstr = string_width(botao_voltar) * global.escala_janela;
        var _hstr = string_height(botao_voltar) * global.escala_janela;
        
        xx = _wgui/2;
        yy = _hgui*0.95;
        
        x1 = xx - _wstr/2;
        y1 = yy - _hstr/2;
        x2 = xx + _wstr/2;
        y2 = yy + _hstr/2;
        
        if(point_in_rectangle(_mx, _my, x1, y1, x2, y2)) { if(mouse_check_button_released(mb_left)) {menu_atual = abas_menu.main;} }
        
        // draw_rectangle(x1, y1, x2, y2, 1); desenhando a colisao do botao
        draw_text_transformed(xx, yy, "VOLTAR", global.escala_janela, global.escala_janela, 0);
        #endregion
        
        break;
    
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1); // Fonte Botões Menu ///Pode mudar para uma fonte personalizada depois
