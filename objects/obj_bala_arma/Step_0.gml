var _inst = instance_place(x, y, obj_DroneBase)

if (_inst != noone){
	_inst.life -= dano*obj_controle_fase.dano_buff
	instance_destroy(self)
}