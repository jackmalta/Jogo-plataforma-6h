/// @description Insert description here
// You can write your code in this editor


//Se eu estou usando a sprite de dano e a animação acabou, eu morro
if (sprite_index == spr_inimigo_porco_dano)
{
	morto = true;
}
if (sprite_index == spr_inimigo_porco_dead)
{
	image_speed = 0;
	image_index = 3;
}