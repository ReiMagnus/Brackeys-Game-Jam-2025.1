/// @description Insert description here
// You can write your code in this editor

if (image_alpha == 1){
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, obj_DroneBase, _list, false);

	if _num > 0{
	    for (var i = 0; i < _num; ++i;){
	        _list[| i].life -= dano*obj_controle_fase.dano_buff
	    }
	}
	
	ds_list_destroy(_list);
}

image_alpha -= 0.01

if (image_alpha <= 0){
	instance_destroy(self)	
}