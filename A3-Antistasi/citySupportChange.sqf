private ["_isDEFENDER","_seaportBoost","_pos","_city","_dataX","_numCiv","_numVeh","_roads","_supportDEFENDER","_supportREBELS"];

waitUntil {!cityIsSupportChanging};
cityIsSupportChanging = true;
_isDEFENDER = _this select 0;
_seaportBoost = _this select 1;
_pos = _this select 2;
if (typeName _pos == typeName "") then {_city = _pos} else {_city = [citiesX, _pos] call BIS_fnc_nearestPosition};
_dataX = server getVariable _city;
if (!(_dataX isEqualType [])) exitWith {
		citySupportChanging = true;
		diag_log format ["%1: [Antistasi] | ERROR | citySupportChange.sqf | Passed %2 as Position.",servertime, _pos];
		};
_numCiv = _dataX select 0;
_numVeh = _dataX select 1;
_supportDEFENDER = _dataX select 2;
_supportREBELS = _dataX select 3;

if (_supportDEFENDER + _supportREBELS + _isDEFENDER > 100) then
	{
	_isDEFENDER = (_supportDEFENDER + _supportREBELS) - 100;
	};
_supportDEFENDER = _supportDEFENDER + _isDEFENDER;
if (_supportDEFENDER + _supportREBELS + _seaportBoost > 100) then
	{
	_seaportBoost = (_supportDEFENDER + _supportREBELS) - 100;
	};
_supportREBELS = _supportREBELS + _seaportBoost;


if (_supportDEFENDER > 100) then {_supportDEFENDER = 100};
if (_supportREBELS > 100) then {_supportREBELS = 100};
if (_supportDEFENDER < 0) then {_supportDEFENDER = 0};
if (_supportREBELS < 0) then {_supportREBELS = 0};

_dataX = [_numCiv, _numVeh,_supportDEFENDER,_supportREBELS];

server setVariable [_city,_dataX,true];
cityIsSupportChanging = false;
true