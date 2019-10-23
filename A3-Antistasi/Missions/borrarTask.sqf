private ["_tiempo","_tsk"];

_tiempo = _this select 0;
_tsk = _this select 1;
if (isNil "_tsk") exitWith {};
if (_tiempo > 0) then {sleep ((_tiempo/2) + random _tiempo)};

if (count misiones > 0) then
	{
	for "_i" from 0 to (count misiones -1) do
		{
		_mision = (misiones select _i) select 0;
		if (_mision == _tsk) exitWith {misiones deleteAt _i; publicVariable "misiones"};
		};
	};

_nul = [_tsk] call BIS_fnc_deleteTask;
