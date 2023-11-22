/// @description Insert description here
// You can write your code in this editor

velh		= 0;
velv		= 0;
vel			= 4;
grav		= .3;
vel_jump	= 7;


pode_escada = false;

posso_perder_vida = true;
dano		= false;
tempo_dano	= room_speed * 0.5;
timer_dano	= 0;

tempo_reinicia = room_speed * 3;
timer_reinicia = tempo_reinicia;

inv_tempo	= room_speed * 2;
inv_timer   = 0;

estado = "out";
sprite_index = spr_player_out;
image_speed = 0;

//Criando a transição de saida da porta SE eu não estou na tela inicial
if (room != rm_tela_inicial)
{
	layer_sequence_create("Transicao", x, y, sq_transicao_out);
}

inputs  = {
		left	: ord("A"),
		right	: ord("D"),
		jump	: ord("K")
}

estado_normal = function()
{
	image_speed = 1;
	var _chao = place_meeting(x, y + 1, obj_chao);
	var _left, _right, _jump;
	_left	= keyboard_check(inputs.left);
	_right	= keyboard_check(inputs.right);
	_jump	= keyboard_check_pressed(inputs.jump);

	if (pode_escada)
	{
		if (keyboard_check(vk_up) && place_meeting(x, y + 1, obj_chao))
		{
			estado = "escada";
		}
		if (keyboard_check(vk_down) && !place_meeting(x, y + 1, obj_chao))
		{
			estado = "escada";
		}
	}

	//Só posso me controlar se o timer do dano esta zerado
	if (timer_dano <= 0)
	{
		velh	= (_right - _left) * vel;
	}



	//Pulando
	if (_chao)
	{
		if (_jump)
		{
			velv = -vel_jump;
		}
	
		//Se eu estou no chão e me movendo
		if (velh != 0)
		{
			//Mudo a sprite
			sprite_index = spr_player_run;
			//Faço ele olhar para onde eu estou indo
			image_xscale = sign(velh);
		}
		else
		{
			sprite_index = spr_player_idle;
		}
	}
	else //Não estou no chão
	{
		//Mudando a sprite
		if (velv < 0)
		{
			sprite_index = spr_player_jump;
		}
		else
		{
			sprite_index = spr_player_fall;
		
			//Se eu estou indo para baixo, aí eu posso cair na cabeça do inimigo
			var _inimigo = instance_place(x, y + 5, obj_inimigo_pai);
		
			//Se eu cai no inimigo
			if (_inimigo)
			{
				dano = false;
				//Se o inimigo não ta morto
				if (_inimigo.morto == false)
				{
				
					//Subo no ar novamente!
					velv = -vel_jump;
			
					//Avisando para o inimigo que eu acertei que ele tomou dano!
					_inimigo.dano = true;
				}
			}
			
		}
	
		//Aplico a gravidade
		velv += grav;
		if (velh != 0)
		{
			image_xscale = sign(velh);
		}
	}

	if (dano)
	{
		sprite_index = spr_player_hit;
		velh = 0;
		if (posso_perder_vida)
		{
			global.vida--;
			
			if (global.vida <= 0)
			{
				estado = "dead";
			}
			else
			{
				posso_perder_vida = false;
			}
			
			
		}
	}

	//Se o timer do dano é maior do que zero, eu diminuo ele
	if (timer_dano > 0)
	{
		timer_dano--;
	}
	else
	{
		//Acabou o meu timer do dano
		dano = false;
		posso_perder_vida = true;
	}
	if (inv_timer > 0)
	{
		inv_timer--;
	
		image_alpha = .5;
	
	}
	else
	{
		image_alpha = 1;
	}

	//Tomando dano
	var _inimigo = instance_place(x, y, obj_inimigo_pai);

	if (_inimigo && inv_timer <= 0)
	{
	
		if (_inimigo.morto == false && _inimigo.dano == false)
		{
			dano = true;
			//Dando o valor do timer dano
			timer_dano  = tempo_dano;
			inv_timer	= inv_tempo;
		}
	}	
}