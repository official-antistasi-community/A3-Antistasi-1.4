/*
	Author: Genesis

	Description:
		Define mines now for faster access later.

	Parameter(s):
		none

	Returns:
		nothing
*/
private _CfgWeaponSubClassesArray = (configfile/"CfgVehicles") call BIS_fnc_getCfgSubClasses;
VCM_MineList = [];
VCM_SatchelList = [];
{
	if !(gettext(configfile/"CfgVehicles"/_x/"ammo") isEqualTo "") then
	{
		private _Ammo =  getText(configfile >> "CfgVehicles" >> _x >> "ammo");
		private _AmmoType = (configfile >> "CfgAmmo" >> _Ammo >> "explosionType") call BIS_fnc_getCfgData;
		if (!(isNil "_AmmoType") && {_AmmoType isEqualTo "mine"}) then
		{
			VCM_MineList pushback [_x,(getText(configfile >> "CfgAmmo" >> _Ammo >> "defaultMagazine")),_Ammo];
		};
		if (!(isNil "_AmmoType") && {_AmmoType isEqualTo "bomb"}) then
		{
			VCM_SatchelList pushback [_x,(getText(configfile >> "CfgAmmo" >> _Ammo >> "defaultMagazine")),_Ammo];
		};		

	};
} forEach _CfgWeaponSubClassesArray;

private _Muzzles = getarray(configfile >> "CfgWeapons" >> "Put" >> "muzzles");
{
	private _Muzz = _x;
	private _MagText= getArray(configfile >> "CfgWeapons" >> "Put" >> _x >> "magazines");
	{
		if ((_x#1) in _MagText) then {VCM_MineList set [_foreachindex,[_x#0,_x#1,_x#2,_Muzz]];};
	} foreach VCM_MineList;
	{ 
		if ((_x#1) in _MagText) then {VCM_SatchelList set [_foreachindex,[_x#0,_x#1,_x#2,_Muzz]];};
	} foreach VCM_SatchelList;
} foreach _Muzzles;


