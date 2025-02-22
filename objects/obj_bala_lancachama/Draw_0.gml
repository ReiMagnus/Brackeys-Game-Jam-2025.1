/// @description Insert description here
// You can write your code in this editor

//draw_self()
draw_sprite_ext(spr_bala_lancachama, fogo0, x, y, 2, 2, fogo0_angle, c_white, alpha_)
draw_sprite_ext(spr_bala_lancachama, fogo1, x, y, 2, 2, fogo1_angle, c_white, alpha_)
draw_sprite_ext(spr_bala_lancachama, fogo2, x, y, 2, 2, fogo2_angle, c_white, alpha_)

fogo0_angle += fogo0_angle_buffer
fogo1_angle += fogo1_angle_buffer 
fogo2_angle += fogo2_angle_buffer

if(alpha_ > 0) {alpha_ -= 1/60;} else {instance_destroy();}