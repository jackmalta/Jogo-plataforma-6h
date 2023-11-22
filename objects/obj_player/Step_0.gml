/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(ord("R"))) game_restart();
//controlando o player
var _chao = place_meeting(x, y + 1, obj_chao);


//Checando se eu estou colidindo com uma escada
pode_escada = place_meeting(x, y, obj_escada);


show_debug_message(pode_escada);

if (global.transicao != false) exit;

switch(estado)
{
	
	case "normal":
		estado_normal();
	break;
	
	case "in":
		mudando_sprite(spr_player_escada);
		
		//Terminou a animação, para a animação
		var _img_vel = sprite_get_speed(sprite_index) / room_speed;
		//Indo para o estado normal
		if (image_index > image_number - _img_vel)
		{
			image_speed = 0;
			image_index = image_number - 1;
			image_alpha = 0;
		}
		
	break;
	
	case "out":
		mudando_sprite(spr_player_out);
		
		
		
		var _img_vel = sprite_get_speed(sprite_index) / room_speed;
		//Indo para o estado normal
		if (image_index > image_number - _img_vel)
		{
			estado = "normal";
		}
		
	break;
	
	case "dead":
		mudando_sprite(spr_player_dead);
		
		timer_reinicia--;
		
		if (timer_reinicia <= 0)
		{
			global.vida = global.max_vida;
			game_restart();
		}
		
		//Ficando visivel
		if (image_alpha < 1)
		{
			image_alpha += 0.01;
		}
		if (image_index > image_number - 1)
		{
			image_speed = 0;
			image_index = image_number - 1;
		}
	break;
	
	case "escada":
		
		//Definindo a sprite dele
		sprite_index = spr_player_escada;
		
		velh = 0;
		velv = 0;
		image_speed = 0;
		
		if (keyboard_check(vk_up))
		{
			velv = -1;
			image_speed = 1;
		}
		
		if (keyboard_check(vk_down))
		{
			velv = 1;
			image_speed = 1;
		}
		
		//Se eu estou no chão e eu aperto para um dos lados, eu saio da escada
		if (_chao && keyboard_check(inputs.right) or keyboard_check(inputs.left))
		{
			estado = "normal";
			image_speed = 1;
		}
		
		if (!place_meeting(x, y + 20, obj_escada))
		{
			estado = "normal";
			image_speed = 1;
		}
		
		
		break;
}
