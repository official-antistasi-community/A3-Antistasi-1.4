
/*
	Author: Genesis

	Description:
		Orders group to clear building

	Parameter(s):
		0: GROUP - Clearing group
		1: OBJECT - Enemy to clear out

	Returns:
		STRING
*/

params ["_Squad","_enemy"];

private _nBuildingLst = nearestObjects [_enemy, ["House", "Building"], 25,true];
_nBuildingLst apply {if ((typeof _x) isEqualTo "babe_helper" || !([_x] call BIS_fnc_isBuildingEnterable)) then {_nBuildingLst = _nBuildingLst - [_x];};};

if (count _nBuildingLst < 1) exitWith {};

private _Start = (getposATL _enemy);
private _End = [(_Start#0),(_Start#1),((_Start#2)+10)];

if !((lineIntersects [ATLToASL _Start, ATLToASL _End])) exitwith{};

private _Building = _nBuildingLst#0;


if (VCM_DebugOld) then {systemchat format ["IS ENTERABLE: %2: %1",([_Building] call BIS_fnc_isBuildingEnterable),_Building];};

private _SquadFSM = _Squad getvariable "VCOM_FSMH";
_SquadFSM setFSMVariable ["_ActivelyClearing",true];
_Squad setCombatMode "BLUE";

//Take our best guess at where the doors are.
private _DoorA = [];
private _JustPositions = [];

private _SelectionNames = (selectionNames _Building);
{
	if (["door",_x] call BIS_fnc_inString) then
	{
		private _doorPos = _Building selectionPosition _x;
		private _WorldPos = (_Building modelToWorld _doorPos);
		private _Door = (_x + "_rot");
		_DoorA pushBack [(_WorldPos#2),_Door,_WorldPos];
	};
} foreach _SelectionNames;

//Let's collect all the building exits
private _BuildingExits = [];
private _BuildingExitsB = [];
private _FindingExits = true;
private _ExitCount = 0;
while {_FindingExits} do
{
	private _BuildingExitPos = _Building buildingExit _ExitCount;
	_ExitCount = _ExitCount + 1;
	if !(_BuildingExitPos isEqualTo [0,0,0]) then
	{
		_BuildingExits pushback _BuildingExitPos;
	}
	else
	{
		_FindingExits = false;
	};
};

_BuildingExitsB = _BuildingExits;


//If there are no doors, we need to find the closest point from the outside for another means
if (count _DoorA isEqualTo 0) then
{
	//private _AllBPositions = [_Building] call BIS_fnc_buildingPositions;

	{
		_BuildingExitsB set [_foreachindex,[(_x#2),_x]];
	} foreach _BuildingExitsB;
	
	_BuildingExitsB sort true;
	
	private _DefaultHeight = (_BuildingExitsB#0)#0;
	
	{
		_BuildingExitsB set [_foreachindex,[((_x#0)-_DefaultHeight),(_x#1)]];
	} foreach _BuildingExitsB;
	
	{
		if (_x#0 < 1.5) then
		{
			_JustPositions pushBack (_x#1);
		};
	} foreach _BuildingExitsB;
}
else
{
	//We have to figure out the average height of the doors.
	_DoorA sort true;
	private _DefaultHeight = (_DoorA#0)#0;
	
	{
		_DoorA set [_foreachindex,[((_x#0)-_DefaultHeight),(_x#1),(_x#2)]];
	} foreach _DoorA;
	
	{
		if (_x#0 < 1.5) then
		{
			_JustPositions pushBack (_x#2);
		};
	} foreach _DoorA;	
};

if (VCM_DebugOld) then {systemchat format ["_JustPositions: %1",(count _JustPositions)]};

if (count _JustPositions < 1) exitwith {_SquadFSM setFSMVariable ["_ActivelyClearing",false];};


if (VCM_DebugOld) then {systemchat format ["_JustPositions: %1",(count _JustPositions)]};


//Order the 1st unit to go to the correct position
private _AliveUnits = (units _Squad select {alive _x});	

//Find the nearest position, this is going to be ground floor door
private _Clst1STPos = [_JustPositions,(_AliveUnits#0),true] call VCM_fnc_ClstObj;
_Clst1STPos = _Clst1STPos getpos [2,(_building getdir _Clst1STPos)];
private _OGUnit = (_AliveUnits#0);
_OGUnit setCombatBehaviour "SAFE"; 
_OGUnit setUnitCombatMode "BLUE";	
[_OGUnit,_Clst1STPos,1.5,60,-1,true,true] spawn VCM_fnc_ForceMoveFSM;


_AliveUnits = _AliveUnits - [_OGUnit];
{
	_Clst1STPos = _Clst1STPos getpos [2,((getdir _building)-90)];
	_x setCombatBehaviour "SAFE"; 
	_x setUnitCombatMode "BLUE";	
	[_x,_Clst1STPos,1.5,60,-1,true,true] spawn VCM_fnc_ForceMoveFSM;			
} foreach _AliveUnits;


private _AllStopped = false;

sleep 10;
private _TimeOut = time + 30;
waituntil 
{
	private _PplMoving = [];
	{
		if (_x distance2D _Clst1STPos < 5) then
		{
			_PplMoving pushback _x;
		};
	} foreach _AliveUnits;
	
	if (count _PplMoving == (count _AliveUnits)) then
	{
		_AllStopped = true;
	};
	
	(_AllStopped || (count (units _Squad select {alive _x}) < 1) || time > _TimeOut)
};



_AliveUnits pushback _OGUnit;

_OGUnit setdir (_OGUnit getdir _Clst1STPos);
[_OGUnit,false,true] spawn VCM_fnc_ForceGrenadeFire;


sleep 6;
_OGUnit playactionnow "gesturePoint";

{
	_x setCombatBehaviour "AWARE"; 
	_x setUnitCombatMode "YELLOW";
	_x forcespeed -1;
	dostop _x;
	_x domove (getposATL _enemy);
	_x moveto (getposATL _enemy);
	sleep 1;
} foreach _AliveUnits;

sleep 30;
_SquadFSM setFSMVariable ["_ActivelyClearing",false];
