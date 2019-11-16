private ["_unit","_flares","_eny","_pos","_veh","_exit"];

_unit = _this select 0;
if (time < _unit getVariable ["smokeUsed",time - 1]) exitWith {};

if (vehicle _unit != _unit) exitWith {};
_flares = _unit getVariable ["usedFlares",3];
if (_flares <= 0) exitWith {};
_eny = objNull;
_exit = false;
if (count _this > 1) then
	{
	_eny = _this select 1;
	if (_eny distance _unit > 300) then {_exit = true};
	};
if (_exit) exitWith {};
_unit setVariable ["smokeUsed",time + 60];
_unit setVariable ["usedFlares",_flares - 1];
//hint "bengala va!";
_pos = if !(isNull _eny) then
	{
	_eny getPos [random 20,random 360];
	}
else
	{
	_unit getPos [100,random 360];
	};
_pos set [2,150];

_veh = "F_40mm_white" createvehicle _pos;
_veh setVelocity [-10+random 20,-10+random 20,-10];
