/// @description Insert description here
// You can write your code in this editor






// Inherit the parent event
event_inherited();

dano	= false;
morto	= false;


muda_sprite = function(_sprite)
{
	//Checar se eu estou com a sprite certa
	if (sprite_index != _sprite)
	{
		sprite_index = _sprite;
		image_index  = 0;
	}
}