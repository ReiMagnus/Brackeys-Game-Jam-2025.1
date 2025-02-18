
if (movement = 0){
	qtd--;
	qtd = clamp(qtd,-2,12)
	x += -2 + round(qtd/2)
}
else{
	qtd++;
	qtd = clamp(qtd,-2,10)
	x += 1 + round(qtd/2)
}


if (keyboard_check(vk_space)) { movement = 1 }
else { movement = 0 }

x = clamp(x,0,room_width-sprite_width)