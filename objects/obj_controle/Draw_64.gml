// Posição do mouse na janela
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Tamanho atual da janela
var _wgui = display_get_gui_width();
var _hgui = display_get_gui_height();

if(pause) { // HUD com o jogo pausado
    
    draw_sprite_ext(spr_FundoPreto, 0, 0, 0, global.escala_janela, global.escala_janela, 0, c_white, 0.25); // Escurecendo a tela
            
    var xx, yy, x1, y1, x2, y2;
    
    var _total_opcoes = 3; // Quantos opções vai ter no menu
    var _tam = 45 * 2//global.escala_janela;
    var _esp = 20 * 2//global.escala_janela;
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
                    case 2 : global.menu = room_goto(rm_Menu); break; // Retornar ao menu
                }
            }
        }
        
        // Draws temporarios
        if(i == 0) {draw_text(xx-25, yy, string("Musica: {0}", global.musica));} else
        if(i == 1) {draw_text(xx-25, yy, string("Sons: {0}", global.sons));}
        if(i == 2) {draw_text(xx-25, yy, "Menu");}
        
        draw_rectangle(x1, y1, x2, y2, 1);
    }
    
}