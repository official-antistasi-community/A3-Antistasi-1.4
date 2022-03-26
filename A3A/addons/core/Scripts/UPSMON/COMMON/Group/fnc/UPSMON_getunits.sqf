/****************************************************************
File: UPSMON_getunits.sqf
Author: Azroul13

Description:
	
Parameter(s):
	<--- Array of units
Returns:
	Array of units
****************************************************************/

private ["_units","_validunits"];

_units = _this select 0;

_validunits = [];

{
	if (alive _x) then 
	{
		If (vehicle _x == _x) then 
		{
			If (_x getvariable ["UPSMON_Supstatus",""] != "SUPRESSED") then
			{
				If (canmove _x) then
				{
					If (canstand _x) then
					{
						If (!([_x] call UPSMON_Inbuilding)) then
						{
							_validunits pushback _x;
						};
					};
				};
			};
		};
	};
}foreach _units;
	
_validunits