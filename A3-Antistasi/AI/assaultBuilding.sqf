private _unit = _this select 0;
_unit setVariable ["maniobrando",true];
private _cercano = _this select 1;
private _building = _this select 2;
_building setVariable ["asaltado",true];

private _buildingPos = _building buildingPos -1;

private _targetPos = if (_buildingPos isEqualTo []) then {position _cercano} else {[_buildingPos,_cercano] call BIS_fnc_nearestPosition};
_timeOut = time + 60;
_unit doMove _targetPos;
while {true} do
	{
	if (time > _timeOut) exitWith {};
	if (!([_unit] call A3A_fnc_canFight) or !([_cercano] call A3A_fnc_canFight)) exitWith {};
	sleep 5;
	};
_building setVariable ["asaltado",false];
_unit setVariable ["maniobrando",false];
_unit call A3A_fnc_recallGroup;
