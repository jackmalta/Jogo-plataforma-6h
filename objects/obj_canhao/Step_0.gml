/// @description Insert description here
// You can write your code in this editor




switch(estado)
{
	//Estado idle, dele parado de boa na lagoa
	case "idle":
		muda_sprite(spr_canhao_idle);
		criei_bala = false;
	
	break;
	
	case "on":
		//Código de quando ele for ativado
		
		muda_sprite(spr_canhao_on);
		
		
		if (image_index >= 1.5 && criei_bala = false)
		{
			//Eu vou criar a bola de canhão
			var _bola = instance_create_layer(x + (5 * image_xscale), y - 11, "projeteis", obj_bola_canhao);
			_bola.velh = (7 + random_range(-3, 3)) * image_xscale;
			_bola.velv = -1;
			
			criei_bala = true;
		}
		
		if (image_index >= image_number - 1)
		{
			estado = "espera";
			
		}
		
	break;
	
	case "espera":
		muda_sprite(spr_canhao_idle);
		timer_tiro--;
		
		//Se o timer do tiro zerou, eu vou para idle E reseto
		if (timer_tiro <= 0)
		{
			timer_tiro = tempo_tiro;
			estado = "idle";
		}
		
	break;
}
