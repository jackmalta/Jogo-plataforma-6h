/// @description Insert description here
// You can write your code in this editor






// Inherit the parent event
event_inherited();
visao  = 100;
estado = "idle"; //idle, run, pega, joga

vel = 1;
tempo_estado = room_speed * 1;
timer_estado = tempo_estado;

tomei_dano	 = false;

ver_o_player = function()
{
	var _vi_player = collision_line(x, y - 14, x + visao * image_xscale, y - 14, obj_player, false, true);
	
	if (_vi_player)
	{
		estado = "joga";
	}
}