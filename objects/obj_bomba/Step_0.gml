/// @description Insert description here
// You can write your code in this editor





velv += grav;
if (place_meeting(x, y + 1, obj_chao))
{
	if (velh != 0)
	{
		velh *= .92;
	}
}
else
{
	velh *= .995;
}

if (momento == "off")
{
	//Código do off
	sprite_index = spr_bomba;
}
else if (momento == "on")
{
	//Código do on
	sprite_index = spr_bomba_on;
	
	//Rodando o boom timer
	if (boom_timer > 0)
	{
		boom_timer--;
	}
	else
	{
		//Se o boom timer for 0 ou menos
		momento = "boom";
	}
}
else if (momento == "boom")
{
	//Código do boom
	
	//Checar se ele já mudou de sprite
	if (sprite_index != spr_bomba_boom)
	{
		//Ou seja, eu acabei de chegar nesse momento
		//Mudo de sprite
		sprite_index = spr_bomba_boom;
		//Começo a animação do 0
		image_index = 0;
	}
	
	
	//Se eu terminei a animação, eu me destruo
	if (image_index >= image_number-1)
	{
		instance_destroy();
	}
	
	//Checando se eu estou colidindo com o player
	var _player = instance_place(x, y, obj_player);
	if (_player)
	{
		with(_player)
		{
			dano = true;
			//Dando o valor do timer dano
			timer_dano  = tempo_dano;
			inv_timer	= inv_tempo;
		}
	}
	
	var _bomba = instance_place(x, y, obj_bomba);
	if (_bomba)
	{
		if (_bomba.momento == "off")
		{
			_bomba.boom_timer = room_speed;
			_bomba.momento = "on";
			
		}
	}
}