private ["_govtSupportChange","_rebelSupportChange","_pos","_city","_dataX","_numCiv","_numVeh","_roads","_govtCitySupport","_rebelCitySupport"];

waitUntil {!cityIsSupportChanging};
cityIsSupportChanging = true;
_govtSupportChange = _this select 0;
_rebelSupportChange = _this select 1;
_pos = _this select 2;
if (typeName _pos == typeName "") then {_city = _pos} else {_city = [citiesX, _pos] call BIS_fnc_nearestPosition};
_dataX = server getVariable _city;
if (!(_dataX isEqualType [])) exitWith {
		cityIsSupportChanging = false;
		diag_log format ["%1: [Antistasi] | ERROR | citySupportChange.sqf | Passed %2 as Position.",servertime, _pos];
		};
_numCiv = _dataX select 0;
_numVeh = _dataX select 1;
_govtCitySupport = _dataX select 2;
_rebelCitySupport = _dataX select 3;

if (_govtCitySupport + _rebelCitySupport + _govtSupportChange > 100) then
	{
	_govtSupportChange = (_govtCitySupport + _rebelCitySupport) - 100;
	};
_govtCitySupport = _govtCitySupport + _govtSupportChange;
if (_govtCitySupport + _rebelCitySupport + _rebelSupportChange > 100) then
	{
	_rebelSupportChange = (_govtCitySupport + _rebelCitySupport) - 100;
	};
_rebelCitySupport = _rebelCitySupport + _rebelSupportChange;


if (_govtCitySupport > 100) then {_govtCitySupport = 100};
if (_rebelCitySupport > 100) then {_rebelCitySupport = 100};
if (_govtCitySupport < 0) then {_govtCitySupport = 0};
if (_rebelCitySupport < 0) then {_rebelCitySupport = 0};

_dataX = [_numCiv, _numVeh,_govtCitySupport,_rebelCitySupport];

server setVariable [_city,_dataX,true];
cityIsSupportChanging = false;
true