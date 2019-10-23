private ["_opfor","_blufor","_pos","_ciudad","_datos","_numCiv","_numVeh","_roads","_prestigeOPFOR","_prestigeBLUFOR"];

waitUntil {!cityIsSupportChanging};
cityIsSupportChanging = true;
_opfor = _this select 0;
_blufor = _this select 1;
_pos = _this select 2;
if (typeName _pos == typeName "") then {_ciudad = _pos} else {_ciudad = [ciudades, _pos] call BIS_fnc_nearestPosition};
_datos = server getVariable _ciudad;
if (!(_datos isEqualType [])) exitWith {citySupportChanging = true; diag_log format ["Antistasi Error in citysupportchange.sqf. Passed %1 as reference",_pos]};
_numCiv = _datos select 0;
_numVeh = _datos select 1;
_prestigeOPFOR = _datos select 2;
_prestigeBLUFOR = _datos select 3;

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

_datos = [_numCiv, _numVeh,_prestigeOPFOR,_prestigeBLUFOR];

server setVariable [_ciudad,_datos,true];
cityIsSupportChanging = false;
true