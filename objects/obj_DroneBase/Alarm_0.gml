// GAMBIARRA
switch(tipo) {
    case 0 : 
        spd = 1; 
        life = 20; 
        range = 5; 
        dano = 1; 
        recar = [0, 0];
        sprite_index = spr_drone_basico; 
        break;
    case 1 : 
        spd = 0.5; 
        life = 40; 
        range = 5; 
        dano = 3; 
        recar = [0, 0];
        sprite_index = spr_drone_parrudo; 
        break;
    case 2 : 
        spd = 2; 
        life = 15; 
        range = 5; 
        dano = 2; 
        recar = [0, 45];
        sprite_index = spr_drone_espinho; 
        break;
    case 3 : 
        spd = 1; 
        life = 20; 
        range = 300; 
        dano = 1; 
        recar = [0, 20];
        sprite_index = spr_drone_arma; 
        break;
    case 4 : 
        spd = 1; 
        life = 20; 
        range = 250; 
        dano = 1; 
        recar = [0, 180];
        sprite_index = spr_drone_lancachama; 
        break;
}
recar[0] = recar[1];