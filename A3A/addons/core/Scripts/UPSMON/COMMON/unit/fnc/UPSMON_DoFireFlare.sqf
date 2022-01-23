/****************************************************************
File: UPSMON_DoFireFlare.sqf
Author: Azroul13

Description:
	
Parameter(s):

Returns:

****************************************************************/
private["_unit","_muzzle","_munition","_target","_direction"];	

_unit = _this select 0;	
_muzzle = _this select 1;
_munition = _this select 2;
_targetpos = _this select 3;

if (alive _unit) then
{
	_target = createVehicle ["UserTexture1m_F",[_targetpos select 0,_targetpos select 1,100], [], 0, "NONE"];
	_unit selectWeapon _muzzle;
	[_unit,_targetpos,100] call UPSMON_DOwatch;
	sleep 0.7;
	_direction = [_unit, _target] call BIS_fnc_dirTo;
	_unit setDir _direction;
	_unit dotarget _target;
	sleep 4;
	[] spawn UPSMON_Flaretime;
	sleep 1;
	if (alive _unit) then
	{
		_unit fire [_muzzle, _muzzle, _munition];
		sleep 1;
		_unit dowatch ObjNull;
	};
	Deletevehicle _target;
};
