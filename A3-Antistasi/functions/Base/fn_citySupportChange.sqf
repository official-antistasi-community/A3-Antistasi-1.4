private ["_opfor","_blufor","_pos","_city","_dataX","_numCiv","_numVeh","_roads","_prestigeOPFOR","_prestigeBLUFOR"];

waitUntil {!cityIsSupportChanging};
cityIsSupportChanging = true;
_opfor = _this select 0;
_blufor = _this select 1;
_pos = _this select 2;
if (_pos isEqualType "") then {_city = _pos} else {_city = [citiesX, _pos] call BIS_fnc_nearestPosition};
_dataX = server getVariable _city;
if (isNil "_dataX" || {!(_dataX isEqualType [])}) exitWith
{
	cityIsSupportChanging = false;
	diag_log format ["%1: [Antistasi] | ERROR | citySupportChange.sqf | Passed %2 as city, pos was %3.",servertime, _city, _pos];
};
_numCiv = _dataX select 0;
_numVeh = _dataX select 1;
_prestigeOPFOR = _dataX select 2;
_prestigeBLUFOR = _dataX select 3;

if (_prestigeOPFOR + _prestigeBLUFOR + _opfor > 100) then
	{
	_opfor = (_prestigeOPFOR + _prestigeBLUFOR) - 100;
	};
_prestigeOPFOR = _prestigeOPFOR + _opfor;
if (_prestigeOPFOR + _prestigeBLUFOR + _blufor > 100) then
	{
	_blufor = (_prestigeOPFOR + _prestigeBLUFOR) - 100;
	};
_prestigeBLUFOR = _prestigeBLUFOR + _blufor;


if (_prestigeOPFOR > 100) then {_prestigeOPFOR = 100};
if (_prestigeBLUFOR > 100) then {_prestigeBLUFOR = 100};
if (_prestigeOPFOR < 0) then {_prestigeOPFOR = 0};
if (_prestigeBLUFOR < 0) then {_prestigeBLUFOR = 0};

_dataX = [_numCiv, _numVeh,_prestigeOPFOR,_prestigeBLUFOR];

server setVariable [_city,_dataX,true];
cityIsSupportChanging = false;
true
