_playerX = player getVariable ["owner",player];

if (_playerX getVariable ["eligible",true]) then
{
	_playerX setVariable ["eligible",false,true];
	if (_playerX == theBoss) then
	{
		private _possiblePlayer = cursorTarget;
		if(!isNull _possiblePlayer && isPlayer _possiblePlayer) then {
			hint format ["You resign of being Commander. It should be passed to %1 if they are eligible.", name _possiblePlayer];
			[cursorTarget] remoteExec ["A3A_fnc_assigntheBoss",2];
		} else {
			hint "You resign of being Commander. Other will take the command if there is someone suitable for it.";
			[] remoteExec ["A3A_fnc_assigntheBoss",2];
		};
		sleep 3;
	}
	else
	{
		hint "You decided not to be eligible for Commander.";
	};
}
else
{
	hint "You are now eligible to be Commander of our forces.";
	_playerX setVariable ["eligible",true,true];
};