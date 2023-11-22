// Auto-generated stubs for each available event.

function sq_transicao_in_Moment()
{
	global.transicao = true;
	//Se existe uma próxima room, eu vou para ela.
	if (room_next(room) != -1)
	{
		room_goto_next();
	}
	//Caso contrário eu começo o jogo do começo
	else 
	{
		room_goto(rm_tela_inicial);
	}
}