private ["_chance","_pos","_marcador","_return"];

_chance = tierWar*3;
{_pos = getPos _x;
_marcador = [puestos,_pos] call BIS_fnc_nearestPosition;
if ((lados getVariable [_marcador,sideUnknown] == buenos) and (alive _x)) then {_chance = _chance + 4};
} forEach antenas;
_return = false;
if (debug) then {_chance = 100};

if (random 100 < _chance) then
	{
	if (count _this == 0) then
		{
		if (not revelar) then
			{
			["TaskSucceeded", ["", "Enemy Comms Intercepted"]] remoteExec ["BIS_fnc_showNotification",buenos];
			revelar = true; publicVariable "revelar";
			[] remoteExec ["A3A_fnc_revealToPlayer",buenos];
			};
		}
	else
		{
		_return = true;
		};
	}
else
	{
	if (count _this == 0) then
		{
		if (revelar) then
			{
			["TaskFailed", ["", "Enemy Comms Lost"]] remoteExec ["BIS_fnc_showNotification",buenos];
			revelar = false; publicVariable "revelar";
			};
		};
	};
_return