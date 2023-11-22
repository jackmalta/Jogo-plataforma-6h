/// @description Insert description here
// You can write your code in this editor


//Desenhando a quantidade de vidas
var _x = 20;
var _y = 40;
var _qtd = 40;
//Desenhando um coração por vida
repeat(global.vida)
{

	desenha_coracao(_x, _y);
	
	//O _x aumenta em qtd
	_x += _qtd;
}