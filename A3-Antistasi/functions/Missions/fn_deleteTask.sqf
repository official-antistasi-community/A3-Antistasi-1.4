private ["_timeX","_tsk"];

_timeX = _this select 0;
_tsk = _this select 1;
if (isNil "_tsk") exitWith {};
if (_timeX > 0) then {sleep ((_timeX/2) + random _timeX)};

if (count missionsX > 0) then
	{
	for "_i" from 0 to (count missionsX -1) do
		{
		_missionX = (missionsX select _i) select 0;
		if (_missionX == _tsk) exitWith {missionsX deleteAt _i; publicVariable "missionsX"};
		};
	};

_nul = [_tsk] call BIS_fnc_deleteTask;
