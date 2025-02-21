
// vida das partes do carro
for (var i = 0; i < 3; i ++){
	if (global.veiculo_vida[i][0] != 0){
		draw_rectangle_color(x+(sprite_width/3)*i+16,y+sprite_height,x+(sprite_width/3)*i+global.veiculo_vida[i][0]+16,y+sprite_height+5,
		c_green,c_green,c_green,c_green,false)

		draw_rectangle(x+(sprite_width/3)*i+16,y+sprite_height,x+(sprite_width/3)*i+global.veiculo_vida[i][1]+16,y+sprite_height+5,true)
	}
}

// partes do carro

if (global.veiculo_vida[0][0] > 0) { draw_sprite(spr_veiculo1,0,x,y) }
else { draw_sprite(spr_veiculo1,1,x,y) }

if (global.veiculo_vida[1][0] > 0) { draw_sprite(spr_veiculo2,0,x,y) }
else { draw_sprite(spr_veiculo2,1,x,y) }

if (global.veiculo_vida[2][0] > 0) { draw_sprite(spr_veiculo3,0,x,y) }
else { draw_sprite(spr_veiculo3,1,x,y) }

draw_self() // desenha a parte de baixo

// atras
draw_sprite(spr_arma_base,0,x+((sprite_width/3)/2),y+8)
switch(global.veiculo_armas[0][0]){
	case 0: draw_sprite_ext(spr_arma_pistola,0,x+((sprite_width/3)/2),y+8,1,1,dir_atras-90,c_white,1) break;
	case 1: draw_sprite_ext(spr_arma_metralhadora,0,x+((sprite_width/3)/2),y+8,1,1,dir_atras-90,c_white,1) break;
	case 2: draw_sprite_ext(spr_arma_pulse,0,x+((sprite_width/3)/2),y+8,1,1,dir_atras-90,c_white,1) break;
	case 3: draw_sprite_ext(spr_arma_serra,0,x+((sprite_width/3)/2),y+8,1,1,0,c_white,1) break;
}

// frente
draw_sprite(spr_arma_base,0,x+(sprite_width/3)+((sprite_width/3)/2),y+8)
switch(global.veiculo_armas[1][0]){
	case 0: draw_sprite_ext(spr_arma_pistola,0,x+(sprite_width/3)+((sprite_width/3)/2),y+8,1,1,dir_frente-90,c_white,1) break;
	case 1: draw_sprite_ext(spr_arma_metralhadora,0,x+(sprite_width/3)+((sprite_width/3)/2),y+8,1,1,dir_frente-90,c_white,1) break;
	case 2: draw_sprite_ext(spr_arma_pulse,0,x+(sprite_width/3)+((sprite_width/3)/2),y+8,1,1,dir_frente-90,c_white,1) break;
	case 3: draw_sprite_ext(spr_arma_serra,0,x+(sprite_width/3)+((sprite_width/3)/2),y+8,1,1,0,c_white,1) break;
}

// traseira
//draw_sprite_ext(spr_arma,0,x+8,y+64,1,1,90,c_white,1)
//draw_sprite_ext(spr_arma_pistola,0,x+8,y+64,1,1,dir_atras-90,c_white,1)

