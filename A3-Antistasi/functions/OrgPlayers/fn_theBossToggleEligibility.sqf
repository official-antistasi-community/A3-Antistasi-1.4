params ["_playerX", ["_suggestedNextBoss", objNull]];

_playerX = _playerX getVariable ["owner", _playerX];

if (_playerX getVariable ["eligible",true]) then
{
	_playerX setVariable ["eligible",false,true];
	if (_playerX == theBoss) then
	{
		theBoss = objNull; publicVariable "theBoss";
		
		if(!isNull _suggestedNextBoss && isPlayer _suggestedNextBoss) then {
			hint format ["You resign of being Commander. It should be passed to %1 if they are eligible.", name _suggestedNextBoss];
			[_suggestedNextBoss] call A3A_fnc_makePlayerBossIfEligible;
		} else {
			hint "You resign of being Commander. Others will take the command if there is someone suitable for it.";
		};
		[] call A3A_fnc_assignBossIfNone;
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
	[] call A3A_fnc_assignBossIfNone;
};