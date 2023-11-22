// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Script1(){

}

randomize();

global.transicao	= false;
global.max_vida		= 3;
global.vida			= global.max_vida;




function mudando_sprite(_sprite)
{
	image_speed  = 1;
	//Checar se eu estou com a sprite certa
	if (sprite_index != _sprite)
	{
		sprite_index = _sprite;
		image_index  = 0;
	}
}