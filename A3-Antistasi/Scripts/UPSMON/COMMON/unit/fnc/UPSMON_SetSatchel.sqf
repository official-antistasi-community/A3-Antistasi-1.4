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
private ["_grp","_attackpos","_currPos","_ATmine","_Atunit","_dir1","_mineposition","_roads","_units"];

_grp = _this select 0;
_attackpos = _this select 1;
_currPos = getposATL (leader _grp);

_grp setvariable ["UPSMON_GrpinAction",true];

If (UPSMON_useMines) then
{
	_Satchelmag = ObjNull;
	_unit = ObjNull;
							
	{
		If (alive _x) then
		{
			If (vehicle _x == _x) then
			{
				If (canstand _x) then
				{
					If ("SatchelCharge_Remote_Mag" in (magazines _x) || "DemoCharge_Remote_Mag" in (magazines _x)) exitwith
					{
						If ("SatchelCharge_Remote_Mag" in (magazines _x)) then
						{
							_Satchelmag = "SatchelCharge_Remote_Mag";
						}
						else
						{
							_Satchelmag = "DemoCharge_Remote_Mag";
						}; 
						
						_unit = _x;
					};
				};
			};
		};
	} foreach units _grp;
	
	_units = units _grp - [_unit];
	
	If (!IsNull _unit) then
	{
		If ((random 100) < 40) then 
		{
			_nosmoke = [_grp] call UPSMON_NOSMOKE;
			If (!_nosmoke) then {[_units,_attackpos] call UPSMON_CreateSmokeCover;};
			[_unit,_grp,_attackpos,_currPos,_Satchelmag] call UPSMON_PutSatchel;	
		};											
	};
};

_grp setvariable ["UPSMON_GrpinAction",false];