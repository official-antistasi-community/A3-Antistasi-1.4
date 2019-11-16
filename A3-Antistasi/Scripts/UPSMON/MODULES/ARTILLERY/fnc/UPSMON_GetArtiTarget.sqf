/****************************************************************
File: UPSMON_GetArtitarget.sqf
Author: Azroul13

Description:
	Get the most interesting target for Arti.

Parameter(s):
	<--- Array of enies
	<--- position of the calling leader
Returns:
	Target
****************************************************************/

private ["_enies","_currpos","_target","_list","_points"];

_enies = _this select 0;
_currpos = _this select 1;

_target = ObjNull;
_list = [];

{	
	If (alive _x) then 
	{																								
		If (_currpos vectordistance (getposATL _x) > 300) then
		{
			If (!((vehicle _x) iskindof "AIR")) then
			{
				_points = 0;
				If (vehicle _x != _x) then
				{
					If ((vehicle _x) iskindof "STATICWEAPON") then
					{
						_points = _points + 100;
					};
				
					If ((vehicle _x) iskindof "CAR" || (vehicle _x) iskindof "TANK") then
					{
						if (Speed _x < 10) then
						{
							_armor  = getNumber  (configFile >> "CfgVehicles" >> (typeof (vehicle _x)) >> "armor");
							If (_armor > 500) then
							{
								_points = _points + 100;
							}
							else
							{
								_points = _points + 50;
							};
							
							If (!(IsNull (Gunner (vehicle _x)))) then
							{
								_points = _points + 100;
							};
						};
					};
					
					_cfgArtillery = getnumber (configFile >> "cfgVehicles" >> (typeOf (vehicle _x)) >> "artilleryScanner");
					
					If (_cfgArtillery == 1) then
					{
						_points = _points + 200;
					};
				}
				else
				{
					If ([_x] call UPSMON_Inbuilding) then
					{
						_points = _points + 100;
					};
					
					_eniesnear = [_x,_enies] call UPSMON_Eniesnear;
					
					If (_eniesnear > 4) then
					{
						_points = _points + (20 * (_eniesnear));
					};
				};
				
				_list pushback [_x,_points];
			};
		};
	};										
} foreach _enies;

If (count _list > 0) then
{
	_list = [_list, [], {_x select 1}, "DESCEND"] call BIS_fnc_sortBy;
	_target = (_list select 0) select 0;
};

_target