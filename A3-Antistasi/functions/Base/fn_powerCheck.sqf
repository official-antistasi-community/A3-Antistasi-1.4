private ["_markerX","_result","_positionX"];
_markerX = _this select 0;
//if (!(_markerX in citiesX)) exitWith {true; diag_log format ["Error en cálculo de antenna para %1",_markerX]};
if (count antennas == 0) exitWith {sideUnknown};
//_result = false;
_positionX = getMarkerPos _markerX;
_ant1 = [antennas,_positionX] call BIS_fnc_nearestPosition;
_ant2 = [antennasDead, _positionX] call BIS_fnc_nearestPosition;

if (_ant1 distance _positionX > _ant2 distance _positionX) exitWith {sideUnknown};

_outpost = [markersX,_ant1] call BIS_fnc_NearestPosition;
/*
if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then
	{
	if (sidesX getVariable [_outpost,sideUnknown] == teamPlayer) then {_result = true};
	}
else
	{
	if (sidesX getVariable [_outpost,sideUnknown] == Occupants) then {_result = true};
	};*/
private _sideX = sidesX getVariable [_outpost,sideUnknown];
//_result
_sideX