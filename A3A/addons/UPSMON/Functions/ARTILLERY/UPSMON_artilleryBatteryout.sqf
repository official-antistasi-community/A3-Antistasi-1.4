/****************************************************************
File: UPSMON_artilleryBatteryout.sqf
Author: Azroul13

Description:
		Mortar units repack the static weapon
Parameter(s):

Returns:
	nothing
****************************************************************/
private ["_batteryunits","_staticteam"];

_batteryunits = _this select 0;

If ((_batteryunits select 0) isEqualType []) then
{
	_staticteam = _batteryunits select 0;
	{
		If (!alive _x) exitwith {_batteryunits = [];};
	} foreach _staticteam; 
				
	If (count _batteryunits > 0) then
	{
		[_staticteam select 0,_staticteam select 1] call UPSMON_Packbag;
	};
		
};