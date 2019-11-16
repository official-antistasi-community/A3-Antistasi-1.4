/****************************************************************
File: UPSMON_DoFireFlare.sqf
Author: Azroul13

Description:
	
Parameter(s):

Returns:

****************************************************************/
private["_unit","_muzzle","_munition","_target"];	

_unit = _this select 0;	
_target = _this select 1;

if (alive _unit) then
{
	_targetpos = getposATL _target;
	_target = createVehicle ["UserTexture1m_F",[_targetpos select 0,_targetpos select 1,5], [], 0, "NONE"];;
	_weapon = primaryweapon _unit;
	_unit selectWeapon _weapon;
	[_unit,_targetpos,1.5] call UPSMON_DOwatch;
	sleep 2;
	_unit doTarget _target;
	sleep 8;
	if (alive _unit) then
	{
		_ammo = _unit ammo _weapon;
		_unit setAmmo [_weapon, 10];
		_unit forceWeaponFire [_weapon, "FullAuto"];
		_unit setAmmo [_weapon, _ammo];
		sleep 1;
		_unit dowatch ObjNull;
		_unit doTarget ObjNull;
	};
	Deletevehicle _target;
};
