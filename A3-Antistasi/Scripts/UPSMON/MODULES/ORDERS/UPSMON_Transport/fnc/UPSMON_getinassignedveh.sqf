/****************************************************************
File: UPSMON_getinassignedveh.sqf
Author: Azroul13

Description:
	Make Units of the group mount in theirs assigned vehicle

Parameter(s):
	<--- Group
	<--- Vehicles assigned to the group
Returns:
	nothing
****************************************************************/

private ["_grp","_assignedvehicle","_validunits","_vehicles","_Cargocount","_Gunnercount","_Commandercount","_Drivercount","_emptypositions","_timeout"];

_grp = _this select 0;
_assignedvehicle = _this select 1;
_targetpos = _this select 2; 
_npc = leader _grp;
_orgbehaviour = behaviour _npc;
_orgformation = formation _npc;
_speedmode = Speedmode _npc;

_grp setvariable ["UPSMON_embarking",true];
(group (driver (_assignedvehicle select 0))) setvariable ["UPSMON_embarking",true];

_vehicles = [];
_validunits = [units _grp] call UPSMON_Getunits;
_unitsIn = _validunits;
{
	_Cargocount = (_x) emptyPositions "Cargo";
	_Gunnercount = (_x) emptyPositions "Gunner"; 
	_Commandercount = (_x) emptyPositions "Commander"; 
	_Drivercount = (_x) emptyPositions "Driver"; 
		
	_emptypositions = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
		
	if (_emptypositions > 0 && canMove _x) then { _vehicles pushback [vehicle _x,_emptypositions];};
} foreach _assignedvehicle;

If (count _validunits > 0 && count _vehicles > 0) then
{
	_grp setbehaviour "SAFE";
	_validunits = [_validunits, _vehicles, true] call UPSMON_selectvehicles;
	_unitsIn = _unitsIn - _validunits;
	_timeout = time + 50;

	{_x disableAI "MOVE"} foreach _assignedvehicle;
	{ 
		waituntil {vehicle _x != _x || !canmove _x || !canstand _x || !alive _x || time > _timeout || movetofailed _x}; 
	} foreach _unitsIn;
						
	// did the leader die?
	If (({alive _x} count units _grp) == 0) exitwith {};								
	
	{_x enableAI "MOVE"} foreach _assignedvehicle;
	_grp setbehaviour _orgbehaviour;
};

If (count _this > 2) then 
{
	If (!((driver (_assignedvehicle select 0)) in units _grp)) then
	{
		(group (driver (_assignedvehicle select 0))) setvariable ["UPSMON_embarking",false];
		(group (driver (_assignedvehicle select 0))) setvariable ["UPSMON_Transportmission",["MOVETODEST",[],_grp]];
		[group (driver (_assignedvehicle select 0)),_this select 2,"MOVE","COLUMN","NORMAL","SAFE","BLUE",1] spawn UPSMON_DocreateWP;
	};
	[_grp,_this select 2,"MOVE",_orgformation,_speedmode,_orgbehaviour,"YELLOW",1] spawn UPSMON_DocreateWP;
};
_grp setvariable ["UPSMON_embarking",false];