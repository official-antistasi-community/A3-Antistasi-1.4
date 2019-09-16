private _groupX = _this;
private _result = objNull;

_enemiesX = _groupX getVariable ["objectivesX",[]];
if (count _enemiesX > 0) then
	{
	for "_i" from 0 to (count _enemiesX) - 1 do
		{
		_eny = (_enemiesX select _i) select 4;
		if (vehicle _eny == _eny) exitWith {_result = _eny};
		};
	};
_result