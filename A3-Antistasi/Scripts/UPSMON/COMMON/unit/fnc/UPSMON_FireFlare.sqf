/****************************************************************
File: UPSMON_FireFlare.sqf
Author: Azroul13

Description:
	
Parameter(s):

Returns:

****************************************************************/
private["_grp","_muzzle","_munition","_weapon","_muzzles","_cfg","_parents","_muns","_flaresclass"];	

_grp = _this select 0;	
_targetpos = _this select 1;

_muzzle = "";
_munition = "";

{
	If (alive _x) then
	{
		_unit = _x;
		If (vehicle _unit == _unit) then
		{
			If (Unitready _unit) then
			{
				_weapon = primaryWeapon _unit;
				If (_weapon != "") then
				{
					_muzzles = getArray(configFile>> "cfgWeapons" >> _weapon >> "muzzles");
					_continue = false;
					{
						if (_x != "this") then
						{
							_cfg = (configFile>> "cfgWeapons" >> _weapon >> _x);
							_parents = [_cfg,true] call BIS_fnc_returnParents;
							If ("UGL_F" in _parents) exitwith
							{
								_muzzle = _x;
								_continue = true;
							};
						};
					} foreach _muzzles;
				
					If (_continue) then
					{
						_muns = getarray (configFile>> "cfgWeapons" >> _weapon >> _muzzle >> "magazines");
						_flaresclass = [];
						{
							_ammo = tolower gettext (configFile>> "CfgMagazines" >> _x >> "ammo");
							_cfg = getnumber (configFile>> "CfgAmmo" >> _ammo >> "useFlare");

							If (_cfg == 1) then
							{
								_flaresclass pushback _x;
							};
						} foreach _muns;
					
						If (count _flaresclass > 0) then
						{
							_continue = false;
							{
								If (_x in (magazines _unit)) exitwith
								{
									_munition = _x;
									_continue = true;
								};
							} foreach _flaresclass;
						
							If (_continue) exitwith
							{
								[_unit,_muzzle,_munition,_targetpos] spawn UPSMON_DoFireFlare;
							};
						};
					};
				};
			};
		}
	}
} foreach units _grp;
