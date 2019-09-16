if !(membershipEnabled) exitWith {hint "Server Member feature is disabled"};
private ["_countX"];
_textX = "In Game Members\n\n";
_countN = 0;

{
_playerX = _x getVariable ["owner",objNull];
if (!isNull _playerX) then
	{
	//_uid = getPlayerUID _playerX;
	if ([_playerX] call A3A_fnc_isMember) then {_textX = format ["%1%2\n",_textX,name _playerX]} else {_countN = _countN + 1};
	};
} forEach playableUnits;

_textX = format ["%1\nNo members:\n%2",_textX,_countN];

hint format ["%1",_textX];