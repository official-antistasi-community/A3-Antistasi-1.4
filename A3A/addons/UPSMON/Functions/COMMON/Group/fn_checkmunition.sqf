/****************************************************************
File: UPSMON_checkmunition.sqf
Author: Azroul13

Description:
	Check if unit in the group is out of munition
Parameter(s):
	<--- leader
Returns:
	Array of units who needs ammo
****************************************************************/

private ["_npc","_units","_result","_unit","_weapon","_magazineclass","_magazines","_weapon","_sweapon","_mags","_magazinescount","_smagazineclass"];
	
_npc = _this select 0;
_units = units _npc;
_result = [];
_minmag = 2;	

{
	If (!IsNull _x) then
	{
		If (alive _x) then
		{
			If (vehicle _x == _x) then
			{
				_unit = _x;
				_magsneeded = [[],[]];
				_weapon = primaryWeapon _unit;
				_sweapon = secondaryWeapon _unit;
				_magazineclass = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
				_smagazineclass = [];
				If (_sweapon != "") then {_smagazineclass = getArray (configFile / "CfgWeapons" / _sweapon / "magazines");};
				_mags = magazinesAmmoFull _unit;
				
				If (count _smagazineclass > 0) then
				{
					_magazinescount = {(_x select 0) in _smagazineclass} count _mags;
					_arr = [];
					{_arr pushback _x} foreach _smagazineclass;
					_magsneeded set [0,_arr];
					If (_magazinescount == 0) then
					{
						If (!(_unit in _result)) then
						{
							_result pushback _unit;
						};
					};
				};
				
				If (count _magazineclass > 0) then
				{
					_magazinescount = {(_x select 0) in _magazineclass} count _mags;
					_arr = [];
					{_arr pushback _x} foreach _magazineclass;
					_magsneeded set [1,_arr];
					If (_magazinescount <= 2) then
					{
						If (!(_unit in _result)) then
						{
							_result pushback _unit;
						};
					};
				};
				
				If (_unit in _result) then
				{
					if (UPSMON_AllowRearm) then
					{
						[_unit,_magsneeded] spawn UPSMON_Rearm;
					};
				};
			};
		};
	};
		
} foreach _units;

_result