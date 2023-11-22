/// @description Insert description here
// You can write your code in this editor



velv += grav;

//Se eu ainda não levei e levei dano, eu vou para o estado de dano
if (dano && !tomei_dano)
{
	estado = "hit";
	tomei_dano = true;
}

switch(estado)
{
	case "idle":
		muda_sprite(spr_porco_bomba_idle);
		
		velh = 0;
		
		ver_o_player();
		
		//Diminuindo o timer do estado
		timer_estado--;
		if (timer_estado <= 0)
		{
			estado = choose("run", "idle");
			timer_estado = tempo_estado;
			
			//Garanto que se ele foi para o estado de run, ele anda
			if (estado == "run")
			{
				velh = choose(-vel, vel);
			}
		}
		
	break;
	
	case "run":
	
		ver_o_player();
		muda_sprite(spr_porco_bomba_run);
		
		//Olhando para o lado certo
		if (velh != 0)
		{
			image_xscale = sign(velh);
		}
		
		//Mudando de direção ao bater na parede
		if (place_meeting(x + velh, y, obj_chao))
		{
			velh *= -1;
		}
		
		timer_estado--;
		if (timer_estado <= 0)
		{
			estado = choose("run", "idle");
			timer_estado = tempo_estado;
		}
		
	break;
	
	case "joga":
		muda_sprite(spr_porco_bomba_joga);
		velh = 0;
		//Se eu terminei a animação, eu vou virar o porco normal
		if (image_index >= image_number - 1)
		{
			
			//Jogando a bomba
			var _bomba = instance_create_layer(x, y - 14, "projeteis", obj_bomba);
			_bomba.velh = 3 * image_xscale;
			_bomba.velv = -3;
			_bomba.momento = "on";
			
			var _novo_porco = instance_create_layer(x, y, layer, obj_inimigo_porco);
			_novo_porco.estado = "normal";
			_novo_porco.pega_bomba = false;
			_novo_porco.velh = 0;
			instance_destroy();
		}
		
	break;
	
	case "pega":
		muda_sprite(spr_porco_bomba_pega);
		velh = 0;
		if (image_index >= image_number - 1)
		{
			estado = "idle";
		}
	break;
	
	case "hit":
		muda_sprite(spr_inimigo_porco_dano);
		
		
		if (image_index >= image_number - 1)
		{
			estado = "dead";
		}
	break;
	
	case "dead":
		muda_sprite(spr_inimigo_porco_dead);
		
		if (image_index >= image_number - 1)
		{
			instance_destroy();
		}
	break;
}