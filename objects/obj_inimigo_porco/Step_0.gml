/// @description Insert description here
// You can write your code in this editor



if (morto) 
{	
	sprite_index = spr_inimigo_porco_dead;
	
	//Sumindo se acabou a minha animação
	if (image_speed <= 0)
	{
		image_alpha -= 0.01;
	}
	//Se eu sumi totalmente, eu me destruo
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
	
	exit;
}

//Checando se o porco esta no chão
var _chao = place_meeting(x, y + 1, obj_chao);

if (estado == "normal")
{
	
	//Checando se eu colidi com uma bomba
	var _bomba = instance_place(x, y, obj_bomba);
	
	if (_bomba && _chao)
	{
		//Se eu não vou pegar a bomba, eu vou ativar ela
		if (pega_bomba == false)
		{
			//checando se ela ta apagada
			if (_bomba.momento == "off")
			{
				estado = "fosforo_on";
			}
		}
		else if (_bomba.momento == "off")
		{
			//Eu vou pegar a bomba então mano!
			instance_destroy(_bomba);
			//Eu vou virar o porco pegando a bomba
			var _novo_porco = instance_create_layer(x, y, layer, obj_inimigo_porco_bomba);
			_novo_porco.estado = "pega";
			instance_destroy();
		}
	}
	
	var _canhao = instance_place(x, y, obj_canhao);
	
	if (_canhao)
	{
		if (_canhao.estado == "idle")
		{
			estado = "fosforo_on";
		}
	}
	
	if (_chao)
	{
		//Vou diminuir o tempo de decidir andar
		tempo_decidir_andar -= 1;
	
		//Se o tempo acabou, eu decido se eu vou andar
		if (tempo_decidir_andar <= 0)
		{
			andando = choose(true, false);
		
		
		
			//Escolhendo a direção se ele decidiu andar
			if (andando)
			{
				velh = choose(vel, -vel);
			}
			else
			{
				velh = 0;	
			}
		
			//Resetando o tempo
			tempo_decidir_andar = room_speed * 3;
		}
	
		//Controlando a animação do inimigo
		if (velh != 0 && dano == false)
		{
			sprite_index = spr_inimigo_porco_run;
			image_xscale = sign(velh);
		}
		else
		{
			sprite_index = spr_inimigo_porco_idle;
		}
	
	
		//Se eu bater na parede, eu mudo de direção
		if (place_meeting(x + velh, y, obj_chao))
		{
			velh *= -1;
		}
	
		//Se eu não posso cair, então quando eu for cair eu mudo de direção
		if (pode_cair == false)
		{
			if (place_meeting(x + (velh * 10), y + 1, obj_chao) == false)
			{
				//Se eu não posso cair e não estou tocando no chão na minha frente
				//então eu mudo de direção
				velh *= -1;
			}
		}
	}
	else
	{	//Se eu não estou no chão, eu aplico a gravidade
		velv += grav;
	
		//velh = 0;
	
		if (velh != 0)
		{
			image_xscale = sign(velh);
		}
	}
}
//Checando se eu estou tomando dano

else if (estado == "fosforo_on")
{
	//Mudando a sprite dele
	if (sprite_index != spr_porco_fosforo_on)
	{
		sprite_index = spr_porco_fosforo_on;
		image_index = 0;
	}
	velh = 0;
	
	
	//Depois que ele acendeu? O fosforo ele muda de estado
	if (image_index >= image_number - 1)
	{
		estado = "fosforo_bomba";
	}
}
else if (estado == "fosforo_bomba")
{
	if (sprite_index != spr_porco_fosforo_bomba)
	{
		sprite_index = spr_porco_fosforo_bomba;
		image_index = 0;
	}
	
	//Terminou a animação
	if (image_index >= image_number - 1)
	{
		var _bomba = instance_place(x, y, obj_bomba);
		if (_bomba)
		{
			_bomba.momento = "on";
			
			//Deixando ele escolher se ele pega a bomba ou se ativa a bomab
			pega_bomba = choose(true, false);
		}
		estado = "normal";
		
		var _canhao = instance_place(x, y, obj_canhao);
		if (_canhao)
		{
			_canhao.estado = "on";
		}
		estado = "normal";
	}
}
if (dano && morto == false)
{
	sprite_index = spr_inimigo_porco_dano;
	velh = 0;
}

