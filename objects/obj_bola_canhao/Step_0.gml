/// @description Insert description here
// You can write your code in this editor


velv += grav;

//Perdendo velocidade até se eu to no ar

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

//Quando eu parar, eu viro uma bomba, por que não?
if (abs(velh) <= 0.1)
{
	//Eu viro uma bomba
	//Criando uma bomba no meu lugar
	instance_create_layer(x, y + sprite_height/2, layer, obj_bomba);
	instance_destroy();
}


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
		_bomba.momento = "on";
	}
}