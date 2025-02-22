var _inst = instance_place(x, y, obj_DroneBase)

if (_inst != noone){
	_inst.life -= dano*obj_controle_fase.dano_buff
	_inst.image_blend = c_red
	_inst.alarm[1] = game_get_speed(gamespeed_fps)*0.1
	instance_destroy(self)
}