#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_group", "_patrolType", "_minDist", "_maxDist", "_dist", "_fromCenter", "_centerPos", "_searchBuildings"];

private _patrolParams = _group getVariable "PATCOM_Patrol_Params";

private _param0 = "";
private _param1 = 0;
private _param2 = 0;
private _param3 = 0;
private _param4 = false;
private _param5 = [];
private _param6 = false;

if (_patrolType != _patrolParams#0) then {
	_param0 = _patrolType;
} else {
	_param0 = _patrolParams#0;
};

if (_minDist != _patrolParams#1) then {
	_param1 = _minDist;
} else {
	_param1 = _patrolParams#1;
};

if (_maxDist != _patrolParams#2) then {
	_param2 = _maxDist;
} else {
	_param2 = _patrolParams#2;
};

if (_dist != _patrolParams#3) then {
	_param3 = _dist;
} else {
	_param3 = _patrolParams#3;
};

if (_fromCenter != _patrolParams#4) then {
	_param4 = _fromCenter;
} else {
	_param4 = _patrolParams#4;
};

if (_centerPos != _patrolParams#5) then {
	_param5 = _centerPos;
} else {
	_param5 = _patrolParams#5;
};

if (_searchBuildings != _patrolParams#6) then {
	_param6 = _searchBuildings;
} else {
	_param6 = _patrolParams#6;
};

_group setVariable ["PATCOM_Patrol_Params", [_param0, _param1, _param2, _param3, _param4, _param5, _param6]];