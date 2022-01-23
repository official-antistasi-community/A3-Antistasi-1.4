/****************************************************************
File: UPSMON_getdefaultmun.sqf
Author: Azroul13

Description:
	Get the number munition for mortar backpack

Parameter(s):
	<--- vehicle type
Returns:
	Array [nbr HE,nbr Smoke,nbr Illum]
****************************************************************/

private ["_vehicle","_cfgArtillerymag","_rounds","_ammo","_parents","_cfg","_count"];

_vehicle = _this select 0;

_cfgArtillerymag = getArray (configFile >> "cfgVehicles" >> _vehicle >> "Turrets" >> "MainTurret" >> "magazines");

_rounds = [0,0,0];

{
	_ammo = tolower gettext (configFile>> "CfgMagazines" >> _x >> "ammo");
	_parents = [(configFile>> "CfgAmmo" >> _ammo),true] call BIS_fnc_returnParents;
	_cfg = tolower gettext (configFile>> "CfgAmmo" >> _ammo >> "submunitionAmmo");
	
	If ("ShellBase" in _parents) then
	{
		_count = getnumber (configFile>> "CfgMagazines" >> _x >> "count");
		_rounds set [0,(_rounds select 0) + _count];
	};

	If (_cfg == "SmokeShellArty") then
	{
		_count = getnumber (configFile>> "CfgMagazines" >> _x >> "count");
		_rounds set [1,(_rounds select 1) + _count];
	};
	
	If ("FlareCore" in _parents) then
	{
		_count = getnumber (configFile>> "CfgMagazines" >> _x >> "count");
		_rounds set [2,(_rounds select 2) + _count];
	};
	
} foreach _cfgArtillerymag;

_rounds