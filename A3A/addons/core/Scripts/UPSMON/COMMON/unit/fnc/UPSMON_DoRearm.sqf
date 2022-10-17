/****************************************************************
File: UPSMON_getunits.sqf
Author: Azroul13

Description:
	
Parameter(s):
	<--- Array of units
Returns:
	Array of units
****************************************************************/

private ["_unit","_magsneeded","_supply","_timeout"];

_unit = _this select 0;
_supply = (_this select 1) select 0;
_magsneeded = (_this select 1) select 1;

_position = getposATL _supply;

_supply setvariable ["UPSMON_Supplyuse",true];
_unit setvariable ["UPSMON_Rearming",true];

Dostop _unit;
_unit Domove _position;
_unit setDestination [_position, "LEADER PLANNED", true];
_unit forcespeed 100;

_timeout = time + (1.4*((getposATL _unit) vectordistance _position));

waituntil {IsNull _unit || IsNull _supply || !alive _unit || !canmove _unit || (getposATL _unit) vectordistance _position <= 4|| time >= _timeout};

If (!IsNull _supply) then
{
	If (!IsNull _unit) then 
	{
		If (alive _unit) then
		{
			If (canmove _unit) then
			{
				If ((getposATL _unit) vectordistance _position <= 4) then
				{
					{
						_supply removeMagazineGlobal _x;
						_unit addMagazineGlobal _x;
					} foreach _magsneeded;
				};
			};
		};
	};
};

If (!IsNull _supply) then
{
	_supply setvariable ["UPSMON_Supplyuse",false];
};

If (!IsNull _unit) then
{
	If (alive _unit) then
	{
		_unit setvariable ["UPSMON_Rearming",false];
		if (_unit != leader (group _unit)) then
		{
			_unit dofollow (leader (group _unit))
		};
	};
};