/****************************************************************
File: UPSMON_getmuninfos.sqf
Author: Azroul13

Description:
	Return Mun information about the mortar in the backpack of the unit

Parameter(s):
	<--- Mission fire
	<--- man holding the mortar backpack
Returns:
	[Number of rounds,class of the munition,indirect range value,hit value]
****************************************************************/

private ["_askmission","_vehicle","_result","_backpack","_cfgArtillerymag","_rounds","_class","_hit","_cfg","_parents","_indirectrange","_ammo","_result"];

_askmission = _this select 0;
_vehicle = _this select 1;

_cfgArtillerymag = getArray (configFile >> "cfgVehicles" >> _vehicle >> "Turrets" >> "MainTurret" >> "magazines");


_rounds = 0;
_class = ObjNull;
_indirectrange = 0;
_hit = 0;
_mags = [];

{
	_ammo = tolower gettext (configFile>> "CfgMagazines" >> _x >> "ammo");
	_parents = [(configFile>> "CfgAmmo" >> _ammo),true] call BIS_fnc_returnParents;
	_cfg = tolower gettext (configFile>> "CfgAmmo" >> _ammo >> "submunitionAmmo");
	
	Switch (_askmission) do 
	{
		case "HE": 
		{
			_rounds = (_grp getvariable ["UPSMON_Mortarmun",[]]) select 0;
			
			If (_rounds > 0) then
			{
				If ("ShellBase" in _parents) then
				{
					_class = _x;
					_indirectrange = (getnumber (configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange")) * 8;
					_hit = getnumber (configFile >> "CfgAmmo" >> _ammo >> "Hit");	
				};
			};
		};
		
		case "AT": 
		{
			_rounds = 0;
		};
		
		case "SMOKE": 
		{
			_rounds = (_grp getvariable ["UPSMON_Mortarmun",[]]) select 1;
			
			If (_rounds > 0) then
			{
				If (_cfg == "SmokeShellArty") then
				{
					_class = _x;
					_indirectrange = getnumber (configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
					_hit = getnumber (configFile >> "CfgAmmo" >> _ammo >> "Hit");	
				};
			};
		};
		
		case "ILLUM": 
		{
			_rounds = (_grp getvariable ["UPSMON_Mortarmun",[]]) select 2;
			
			If (_rounds > 0) then
			{
				If ("FlareCore" in _parents) then
				{
					_class = _x;
					_indirectrange = getnumber (configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
					_hit = getnumber (configFile >> "CfgAmmo" >> _ammo >> "Hit");	
				};
			};
		};
	};	
} foreach _cfgArtillerymag;

_result = [_rounds,_class,_indirectrange,_hit];
_result