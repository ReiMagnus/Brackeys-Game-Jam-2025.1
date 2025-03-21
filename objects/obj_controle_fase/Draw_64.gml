// Posição do mouse na janela
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Tamanho atual da janela
var _wgui = display_get_gui_width();
var _hgui = display_get_gui_height();

// conserta gui da fase
display_set_gui_size(640, 360);

if (room = rm_Fase){
	if (temp_fase != 0){
		if(!pause){
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt_BotoesMenu);
	
			//draw_text_color(_wgui/2, 16, temp_fase/60, c_black,  c_black,  c_black,  c_black, 1)
	
			draw_set_halign(-1);
			draw_set_valign(-1);
			draw_set_font(-1);
			
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			
			if (veiculo_equip != -1){ draw_sprite_ext(spr_equips_outlined, veiculo_equip, _wgui-32, _hgui-32, 1, 1, 0, c_white, 1) }
			
			draw_set_color($45993D)
			draw_rectangle(0,0,_wgui-((temp_fase*_wgui)/temp_fase_total),6, false)
			draw_set_color(c_white)
		}
	}
	else{
		// calcular desempenho
		var estrelas_des = 0
		
		for (var i = 0; i < 3; i++){
			if (global.veiculo_vida[i][0] >= ((global.veiculo_vida[i][1]/2))){
				estrelas_des++
			}
		}
		
		if (estrelas_des == 0) { estrelas_des = 1 }
			
		global.info_fases[fase-1][1] = estrelas_des
		global.info_fases[fase][0] = true
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_font(global.fnt_texto_hud);
		
		// desenha estrelas do nivel, desempenho
		draw_sprite(spr_fase_final, 0, 0 , 0)
		
		for (var j = -1; j < 2; j++){
			if ((j+1) < global.info_fases[fase-1][1]) { draw_sprite_ext(spr_stars, 1,_wgui/2 + (50*j), 64, 1, 1, 0, c_white, 1) }
			else { draw_sprite_ext(spr_stars, 0,_wgui/2 + (50*j), 64, 1, 1, 0, c_white, 1) }
		}
		
		// info do nivel
		for (var i = 0; i < 3; i++){
			draw_sprite(spr_icons_stats,i,_wgui/2-86,_hgui/2-48+(34*i))
			if (i == 0){
				var temp = temp_fase_total/60
				draw_text_color(_wgui/2-86+38,_hgui/2-48+14+(34*i), string(temp) + " sec" , c_white,  c_white,  c_white,  c_white, 1)
			}
			if (i == 1){
				var inimi = global.info_estatisticas.inimi + global.inimigo_total
				
				draw_text_color(_wgui/2-86+38,_hgui/2-48+14+(34*i), global.inimigo_total, c_white,  c_white,  c_white,  c_white, 1)
				draw_text_color(_wgui/2-42+38,_hgui/2-48+14+(34*i), "Total: " + string(inimi), c_white,  c_white,  c_white,  c_white, 1)
			}
			if (i == 2){
				var din = global.dinheiro + global.dinhe_total
				draw_text_color(_wgui/2-86+38,_hgui/2-48+14+(34*i), global.dinhe_total, c_white,  c_white,  c_white,  c_white, 1)
				draw_text_color(_wgui/2-42+38,_hgui/2-48+14+(34*i), "Total: " + string(din), c_white,  c_white,  c_white,  c_white, 1)
			}
		}
		
		var menu_width = sprite_get_width(spr_menu)
		var menu_height = sprite_get_height(spr_menu)
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_sprite_ext(spr_menu, 0, _wgui/2-(menu_width/2),_hgui/2+70, 1, 1, 0, c_white, 1)
	
		// botão menu
		if(point_in_rectangle(_mx, _my, _wgui/2-(menu_width/2), _hgui/2+70,_wgui/2-(menu_width/2)+menu_width, _hgui/2+70+menu_height)){
			if(mouse_check_button_released(mb_left)){
				show_debug_message(global.info_estatisticas)
				play_sfx(sfx_menu_simples);
				global.info_estatisticas.tempo += temp_fase_total
				global.info_estatisticas.dinhe += global.dinhe_total
				global.info_estatisticas.inimi += global.inimigo_total
				global.info_estatisticas.jogos++;
				
				global.dinheiro += global.dinhe_total
				
				room_goto(rm_Menu)
			}
		}
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_color($95BF91)
		draw_text(_wgui/2,_hgui/2+83, "MENU")
		
		draw_set_halign(-1);
		draw_set_valign(-1);
		draw_set_font(-1);
		draw_set_color(c_white)
	}
}



if(pause && temp_fase != 0 && !gameOver) { // HUD com o jogo pausado
    // conserta gui da fase
	display_set_gui_size(1280, 720);

    draw_sprite_ext(spr_FundoPreto, 0, 0, 0, global.escala_janela, global.escala_janela, 0, c_white, 0.25); // Escurecendo a tela
            
    var xx, yy, x1, y1, x2, y2;
    
    var _total_opcoes = 3; // Quantos opções vai ter no menu
    var _tam = 45 * 2//global.escala_janela;
    var _esp = 20 * 2//global.escala_janela;
    var _total = (_tam*2)*_total_opcoes + _esp*(_total_opcoes-1)
    
    
    for(var i = 0; i < _total_opcoes; i++) {
        xx = ((_wgui/2-_total/2) + _tam) + ((_tam*2+_esp)*i);
        yy = _hgui/2;
        
        x1 = xx - _tam;
        y1 = yy - _tam;
        x2 = xx + _tam;
        y2 = yy + _tam;
        
        if(point_in_rectangle(_mx, _my, x1, y1, x2, y2)) {
            if(mouse_check_button_released(mb_left)) {
                switch(i) {
                    case 0 : 
                        global.musica = global.musica == true ? false : true;
                        if(global.musica) {play_sfx(sfx_menu_alt_1);} else {play_sfx(sfx_menu_alt_0);}
                        play_music();
                    break; // Musíca
                    case 1 : 
                        global.sons = global.sons == true ? false : true;
                        if(global.sons) {play_sfx(sfx_menu_alt_1);} else {play_sfx(sfx_menu_alt_0);}
                    break; // Som
                    case 2 : global.menu = room_goto(rm_Menu); play_sfx(sfx_menu_simples); break; // Retornar ao menu
                }
            }
        }
        
        // Draws temporarios
		if (i == 0) {draw_sprite_ext(spr_icons, 4+sign(global.musica), x1, y1, global.escala_janela*2, global.escala_janela*2, 0, c_white, 1)}
        if (i == 1) {draw_sprite_ext(spr_icons, 6+sign(global.sons), x1, y1, global.escala_janela*2, global.escala_janela*2, 0, c_white, 1)}
		if (i == 2) {draw_sprite_ext(spr_icons, 0, x1, y1, global.escala_janela*2, global.escala_janela*2, 0, c_white, 1)}
		
        //if(i == 0) {draw_text(xx-25, yy, string("Musica: {0}", global.musica));} else
        //if(i == 1) {draw_text(xx-25, yy, string("Sons: {0}", global.sons));}
        //if(i == 2) {draw_text(xx-25, yy, "Menu");}
        
        //draw_rectangle(x1, y1, x2, y2, 1);
    }
}

if (gameOver == 1){
	draw_sprite_ext(spr_FundoPreto, 0, 0, 0, global.escala_janela, global.escala_janela, 0, c_white, 0.25); // Escurecendo a tela
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(global.fnt_texto_hud);
	
	draw_text_transformed(_wgui/2, _hgui/2, "GAME OVER", global.escala_janela, global.escala_janela, 0)
	
	
	var menu_width = sprite_get_width(spr_menu)
	var menu_height = sprite_get_height(spr_menu)
		
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_sprite_ext(spr_menu, 1, _wgui/2-(menu_width/2),_hgui/2+35, 1, 1, 0, c_white, 1)
	
	// botão menu
	if(point_in_rectangle(_mx, _my, _wgui/2-(menu_width/2), _hgui/2+35,_wgui/2-(menu_width/2)+menu_width, _hgui/2+35+menu_height)){
		if(mouse_check_button_released(mb_left)){
			play_sfx(sfx_menu_simples);
			global.info_estatisticas.tempo += temp_fase_total
			global.info_estatisticas.dinhe += global.dinhe_total
			global.info_estatisticas.inimi += global.inimigo_total
			global.info_estatisticas.jogos++;
				
			global.dinheiro += global.dinhe_total
				
			room_goto(rm_Menu)
		}
	}
		
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white)
	draw_text(_wgui/2,_hgui/2+48, "MENU")
		
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
	draw_set_color(c_white)	
		
}