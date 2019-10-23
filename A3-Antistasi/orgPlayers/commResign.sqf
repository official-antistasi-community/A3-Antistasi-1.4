_jugador = player getVariable ["owner",player];

if (_jugador getVariable ["elegible",true]) then
	{
	_jugador setVariable ["elegible",false,true];
	if (_jugador == theBoss) then
		{
		hint "You resign of being Commander. Other will take the command if there is someone suitable for it.";
		sleep 3;
		[] remoteExec ["A3A_fnc_assigntheBoss",2];
		}
	else
		{
		hint "You decided not to be elegible for Commander.";
		};
	}
else
	{
	hint "You are now elegible to be Commander of our forces.";
	_jugador setVariable ["elegible",true,true];
	};