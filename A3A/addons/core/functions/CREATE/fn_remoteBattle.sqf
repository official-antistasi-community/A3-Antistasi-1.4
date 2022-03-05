private _soldiers = _this;

waitUntil {sleep 10;{([_x] call A3A_fnc_canFight) and (vehicle _x == _x)} count _soldiers == {[_x] call A3A_fnc_canFight} count _soldiers};

if ({[_x] call A3A_fnc_canFight} count _soldiers == 0) exitWith {};
private _sideX = side (group (_soldiers select 0));
private _eny = [teamPlayer];
if (_sideX == Occupants) then {_eny pushBack Invaders} else {_eny pushBack Occupants};

while {true} do
	{
	sleep 10;//poner 10
	_soldiers = _soldiers select {[_x] call A3A_fnc_canFight};
	if (_soldiers isEqualTo []) exitWith {};
	_exit = false;
	_enemiesX = [];
	{
	_soldierX = _x;
	{
	if ((_x distance _soldierX < (2*distanceSPWN)) and (isPlayer _x)) then
		{
		_exit = true
		}
	else
		{
		if ((_x distance _soldierX < (distanceSPWN/2)) and {[_x] call A3A_fnc_canFight} and {side group _x in _eny} and {vehicle _x == _x}) then
			{
			_enemiesX pushBackUnique _x;
			};
		};
	} forEach (allUnits - _soldiers);
	} forEach _soldiers;
	if (_exit) exitWith {};
	if !(_enemiesX isEqualTo []) then
		{
		_chanceToKill = 50 * ((count _soldiers) / (count _enemiesX));
		if (random 100 <= _chanceToKill) then
			{
			(selectRandom _enemiesX) setDamage 1;
			}
		else
			{
			(selectRandom _soldiers) setDamage 1;
			};
		};
	};