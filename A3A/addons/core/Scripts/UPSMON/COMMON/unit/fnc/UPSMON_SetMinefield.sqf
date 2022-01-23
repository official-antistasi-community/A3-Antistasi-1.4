/****************************************************************
File: UPSMON_SetMinefield.sqf
Author: MONSADA

Description:
	Function to put a mine
Parameter(s):
	<--- unit
	<--- position where to put the mine
	<--- Classname of the mine
Returns:

****************************************************************/
private ["_grp","_attackpos","_currPos","_ATmine","_Atunit","_dir1","_mineposition","_roads"];

_grp = _this select 0;
_attackpos = _this select 1;
_currPos = getposATL (leader _grp);

If (UPSMON_useMines) then
{
	_ATmag = ObjNull;
	_unit = ObjNull;
							
	{
		If (alive _x) then
		{
			If (vehicle _x == _x) then
			{
				If (canstand _x) then
				{
					If ("ATMine_Range_Mag" in (magazines _x) || "SLAMDirectionalMine_Wire_Mag" in (magazines _x)) exitwith
					{
						If ("ATMine_Range_Mag" in (magazines _x)) then
						{
							_ATmag = "ATMine_Range_Mag";
						}
						else
						{
							_ATmag = "SLAMDirectionalMine_Wire_Mag";
						};
						_Atunit = _x;
					};
				};
			};
		};
	} foreach units _grp;
	
	If (!IsNull _unit) then
	{
		If ((random 100) < 40) then 
		{
			_dir1 = [_currPos,_attackpos] call BIS_fnc_DirTo;;
			_mineposition = [_currPos,_dir1, 30] call UPSMON_GetPos2D;	
			_roads = _mineposition nearroads 25;
			if (count _roads > 0) then {_mineposition = getposATL (_roads select 0);};
			[_unit,_grp,_mineposition,_currPos,_ATmag] spawn UPSMON_PutMine;													
		};											
	};
};