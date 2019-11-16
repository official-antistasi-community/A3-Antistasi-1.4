/****************************************************************
File: UPSMON_checkleaveVehicle.sqf
Author: MONSADA

Description:
	If every on is outside, make sure driver can move
Parameter(s):
	<--- leader
	<--- vehicle
	<--- driver 
Returns:
	Nothing
****************************************************************/
private["_assignedvehicle","_vehiclesneedsupply","_fuel","_damage","_magazinescount","_weapon","_basepos","_air","_mags"];	
_assignedvehicle = _this select 0;

_vehiclesneedsupply = [];
_supplyneeded = [];

{
	If (alive _x) then
	{
		If (canmove _x) then
		{
			If (!(vehicle _x in _vehiclesneedsupply)) then
			{
				_fuel = fuel (vehicle _x);
				_damage = damage (vehicle _x);
				_magazinescount = 100;
					
				if (!IsNull (Gunner (vehicle _x))) then
				{
					_magazinescount = 0;
					_mags = magazinesAmmo (vehicle _x);
					{
						_magazinescount = _magazinescount + (_x select 1);
					} foreach _mags;
					_supplyneeded pushback "munition";
				};
				_enoughfuel = true;
				_fuelneeded = 0.3;
					
				If ((vehicle _x) iskindof "AIR") then
				{
					_dist = (getposATL _x) vectordistance ((_grp getvariable ["UPSMON_Origin",[]]) select 0);
					_fuelneeded = ((0.000537*_dist) / 100) + 0.0005;
					_supplyneeded pushback "fuel";						
				};
					
				If (_damage > 0.5) then {_supplyneeded pushback "repair";};
				If (_fuel <= _fuelneeded) then {_supplyneeded pushback "fuel";};
					
				If (_damage > 0.5 || (_fuel <= _fuelneeded && !(vehicle _x iskindof "STATICWEAPON")) || _magazinescount <= 2) then
				{
					_vehiclesneedsupply pushback _x;
				};
			};
		};
	};
} foreach _assignedvehicle;

_grp setvariable ["UPSMON_Supplyneeded",_supplyneeded];

_vehiclesneedsupply;
