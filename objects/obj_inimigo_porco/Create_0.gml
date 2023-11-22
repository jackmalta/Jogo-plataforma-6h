/// @description Insert description here
// You can write your code in this editor






// Inherit the parent event
event_inherited();

//Personalizando as variáveis
//Ele vai decidir se ele pode andar para a direita ou para a esquerda

vel = choose(1, -1);
estado = "normal";

pega_bomba = true;

andando = choose(true, false);

if (andando)
{
	if (andando)
	{
		velh = choose(vel, -vel);
		
	}
	else
	{
		velh = 0;	
	}
}

tempo_decidir_andar = room_speed * 3;