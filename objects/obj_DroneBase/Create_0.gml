//
tipo  = 0; // melee: 0, 1, 2 | ranged: 3, 4
spd   = 0;
life  = 0;

range = 0;
dano  = 0;
recar = [0, 0]; // tempo em frames

atirar = false; // Modo para drones ranged
hsp = 0;
vsp = 0;

// Ajustei no local de ataca dos drones para diferencias
mirax = irandom_range(-sprite_get_width(spr_veiculo)*0.4, sprite_get_width(spr_veiculo)*0.4);
miray = irandom_range(-sprite_get_height(spr_veiculo)*0.35, sprite_get_height(spr_veiculo)*0.3);

alarm_set(0, 1); // Gambiarra pq POR ALGUM MOTIVO O GAMEMAKER NAO FAZ OQ EU SEMPRE FIZ