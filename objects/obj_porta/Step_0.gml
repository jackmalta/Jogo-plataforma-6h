/// @description Insert description here
// You can write your code in this editor



//Se ta rolando uma transição, eu não faço nada
if (global.transicao != false) exit;


switch(estado)
{
	case "idle":
		sprite_index = spr_porta;
		image_speed  = 1;
		
		//Se eu tô colidindo com o player e ele apertou a seta para cima, ele entra
		var _player = instance_place(x, y, obj_player);
		if (_player)
		{
			//Checando se ele apertou a seta para cima
			if (keyboard_check_pressed(ord("W")) && saida)
			{
				estado = "abrindo";
				
				//Fazendo o player ir para o estado de entrando "in"
				_player.estado = "in";
			}
		}
		
	break;
	
	case "abrindo":
		mudando_sprite(spr_porta_abre);
		
		//Terminou de abrir, ela fica parada
		if (image_index >= image_number - 1)
		{
			image_speed = 0;
			
			//Crio a minha transição
			layer_sequence_create("Transicao", obj_player.x, obj_player.y, sq_transicao_in);
		}
		
	break;
	
	case "fechando":
		mudando_sprite(spr_porta_fecha);
		
		//Saindo do estado de fechando
		if (image_index >= image_number - 1)
		{
			estado = "idle";
		}
		
	break;
}