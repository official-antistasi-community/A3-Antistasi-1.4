if !(isServer) exitWith {};
params ["_playerX", ["_newBoss", objNull]];

// Find real player unit, in case of remote control
_playerX = _playerX getVariable ["owner", _playerX];

private _text = "";
if (_playerX getVariable ["eligible",false]) then
{
	_playerX setVariable ["eligible",false,true];
	if (_playerX == theBoss) then
	{
		if(!isNull _newBoss && isPlayer _newBoss) then
		{
			if ([_newBoss] call A3A_fnc_makePlayerBossIfEligible) then {
				_text = format ["You resign from being commander, choosing %1 as your successor.", name _newBoss];
			}
			else {
				_text = format ["You resign from being commander. Your chosen successor (%1) was not eligible.", name _newBoss];
			};
		}
		else {
			_text = "You resign from being Commander. Others will take the command if there is someone suitable.";
		};
	}
	else
	{
		_text = "You decided not to be eligible for commander.";
	};
}
else
{
	_playerX setVariable ["eligible",true,true];
	_text = "You are now eligible to be commander of our forces.";
};

["Commander", _text] remoteExec ["A3A_fnc_customHint", _playerX];

// Will remove current boss if now ineligible
[] call A3A_fnc_assignBossIfNone;
