//example: _result = [distanceSPWN,0,posHQ,Invaders] call A3A_fnc_distanceUnits: devuelve un array con todas las que estén a menos de distanceSPWN
//example: _result = [distanceSPWN,1,posHQ,teamPlayer] call A3A_fnc_distanceUnits: devuelve un boolean si hay una que esté a menos de distanceSPWN
params ["_distanceX","_modeX","_reference","_variable"];

_distanceX = _this select 0;//la distanceX requisito, normalmente distanceSPWN)
_modeX = _this select 1;//lo que devuelve la función, 0 un array, un número mayor un boolean cuando la countX llegue a ese número.
_reference = _this select 2; // posición en formatX array u objectX
_variable = _this select 3;//side
private _result = false;
private _allUnits = allUnits select {_x getVariable ["spawner",false]};
if (_modeX == 0) then
	{
	_result = [];
	{
	if (side group _x == _variable) then
		{
		if (_x distance2D _reference < _distanceX) then
			{
			_result pushBack _x;
			};
		};
	} forEach _allUnits;
	}
else
	{
	{if ((side group _x == _variable) and (_x distance2D _reference < _distanceX)) exitWith {_result = true}} count _allUnits;
	};

_result
