/****************************************************************
File: UPSMON_SortOutBldpos.sqf
Author: Azroul13

Description:
	Get All position from a building

Parameter(s):
	<--- building
	<--- Search parameters: get only 1st floor position or upstairs position or both ("RANDOMUP"/"RANDOMDN"/"RANDOMA")
Returns:
	Array of bldpos
****************************************************************/

private ["_bld","_initpos","_height","_bldpos","_checkheight","_downpos","_roofpos","_allpos","_bldpos1","_posz"];

_bld = _this select 0;
_initpos = _this select 1;
_height = 2;
	
_bldpos = [_bld, 70] call BIS_fnc_buildingPositions;
_checkheight = [_bldpos] call UPSMON_gethighestbldpos;
If (_checkheight > _height) then {If (_checkheight >= 4) then {_height = _checkheight - 1.5;} else {_height = _checkheight - 0.5;};};

_downpos = [];
_roofpos = [];
_allpos = [];

{
	_bldpos1 = _x;
	_posz = _bldpos1 select 2;

	If (_posz >= _height) then {_roofpos pushback _bldpos1;};
	If (_posz < _height) then {_downpos pushback _bldpos1;};
			
} foreach _bldpos;

If (count _downpos > 1) then
{
	_downpos = _downpos call UPSMON_arrayShufflePlus;
};

If (count _roofpos > 1) then
{
	_roofpos = _roofpos call UPSMON_arrayShufflePlus;
};

If (_initpos == "RANDOMUP") then {_allpos pushback _roofpos; _allpos pushback _downpos;};
If (_initpos == "RANDOMDN") then {_allpos pushback _downpos; _allpos pushback _roofpos;};
If (_initpos == "RANDOMA") then {_allpostemp = [_downpos,_roofpos] call BIS_fnc_arrayPushStack;_allpos pushback _allpostemp;_allpos pushback [];};


if (_initpos == "RANDOMA") then
{
	If (count (_allpos select 0) > 1) then
	{
		_allpostemp = (_allpos select 0) call UPSMON_arrayShufflePlus;
		_allpos set [0,_allpostemp];
	};
};

if (count _allpos > 0) then 
{
	if (UPSMON_Debug > 0) then
	{	{
			If (count _x > 0) then
			{
				{
					_ballCover = "Sign_Arrow_Large_GREEN_F" createvehicle [0,0,0];
					_ballCover setpos _x;	
				} foreach _x;
			};
		} foreach _allpos;
	};
};

_allpos;