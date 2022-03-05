private _unitsX = _this;
private _buildings = (nearestTerrainObjects [(leader (_unitsX select 0)),["House"],100]) select {count (_x buildingPos -1) > 0};
if (_buildings isEqualTo []) exitWith {};
private _groupX = group (_unitsX select 0);
private _buildingPos = [];
private _occupiedX = _groupX getVariable ["occupiedX",[]];
private _exit = false;

{
_bld = _x;
{
if !(_x in _occupiedX) then
	{
	_buildingPos pushBack _x;
	_occupiedX pushBack _x;
	if (count _unitsX == count _buildingPos) exitWith {_exit = true};
	};
} forEach (_bld buildingPos -1);
if (_exit) exitWith {};
} forEach _buildings;
if (_buildingPos isEqualTo []) exitWith {};
if (count _unitsX > count _buildingPos) then {_buildingPos resize (count _unitsX)};
_groupX setVariable ["occupiedX",_occupiedX];
{
_pos = _buildingPos select _forEachIndex;
if (isNil "_pos") exitWith {};
_x setVariable ["maneuvering",true];
_x disableAI "TARGET";
_x disableAI "AUTOTARGET";
_x disableAI "SUPPRESSION";
_x disableAI "CHECKVISIBLE";
_x disableAI "COVER";
_x disableAI "AUTOCOMBAT";
_x doMove _pos;
[_x,_pos] spawn
	{
	private _unit = _this select 0;
	private _pos = _this select 1;
	_timeOut = time + 60;
	waitUntil {sleep 1; (_unit distance _pos < 1.5) or !(alive _unit) or (time > _timeOut) or !(_unit getVariable ["maneuvering",false])};
	_unit enableAI "TARGET";
	_unit enableAI "AUTOTARGET";
	_unit enableAI "SUPPRESSION";
	_unit enableAI "CHECKVISIBLE";
	_unit enableAI "COVER";
	_unit enableAI "AUTOCOMBAT";
	if (time > _timeOut) exitWith {};
	if !(alive _unit) exitWith {};
	if !(_unit getVariable ["maneuvering",false]) exitWith {};
	_unit forceSpeed 0;
	};
} forEach _unitsX;
