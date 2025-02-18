
for (var i = 0; i < 3; i ++){
	draw_rectangle_color(x+(sprite_width/3)*i,y,x+(sprite_width/3)*i+ds_grid_get(global.ds_veiculo_vida,i,0),y+5,
	c_green,c_green,c_green,c_green,false)

	draw_rectangle(x+(sprite_width/3)*i,y,x+(sprite_width/3)*i+ds_grid_get(global.ds_veiculo_vida,i,1),y+5,true)
}

draw_sprite(spr_veiculo1,0,x,y)
draw_sprite(spr_veiculo2,0,x,y)
draw_sprite(spr_veiculo3,0,x,y)
draw_self()