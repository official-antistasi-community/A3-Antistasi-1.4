/****************************************************************
File: UPSMON_getAmbushpos.sqf
Author: Azroul13

Description:
	Search an ambush position near the leader of the group.
	It will search in priority a road position near the leader if it doesn't find any roads it will take the position of the leader as the ambush position.

Parameter(s):
	<--- Leader of the group
Returns:
	---> Ambush Position. 
	This position is used in the main loop for the ambush behaviour. 
****************************************************************/

private ["_grp","_Ucthis","_position","_npc","_ambushdir","_ambushType","_ambushdist","_Mines","_Minestype","_npcdir","_roads","_roadConnectedTo","_connectedRoad","_minetype1","_minetype2"];
	
_grp = _this select 0;
_Ucthis = _this select 1;
_position = _this select 2;
_npc = leader _grp;
_ambushdir = "";
_ambushType = 1;
_ambushdist = UPSMON_ambushdist;
_Mines = 4;
_Minestype = 1;
	
_ambushdir = ["AMBUSHDIR:",_ambushdir,_UCthis] call UPSMON_getArg;_ambushdir = ["AMBUSHDIR2:",_ambushdir,_UCthis] call UPSMON_getArg;
_ambushType = if ("AMBUSH2" in _UCthis || "AMBUSHDIR2:" in _UCthis || "AMBUSH2:" in _UCthis) then {2} else {_ambushType};
if ("AMBUSHDIST:" in _UCthis) then {_ambushdist = ["AMBUSHDIST:",_ambushdist,_UCthis] call UPSMON_getArg;} else {_ambushdist = 100};
// Mine Parameter (for ambush)	
if ("MINE:" in _UCthis) then {_Mines = ["MINE:",_Mines,_UCthis] call UPSMON_getArg;}; // ajout
if ("MINEtype:" in _UCthis) then {_Minestype = ["MINEtype:",_Minestype,_UCthis] call UPSMON_getArg;}; // ajout	
	

_positiontoambush = _position;
	
_npcdir = getDir _npc;
(group _npc) setCombatMode "BLUE";
	
If (_ambushdir != "") then 
{
	switch (_ambushdir) do 
	{
		case "NORTH": {_npcdir = 0;};
		case "NORTHEAST":{_npcdir = 45;};
		case "EAST": {_npcdir = 90;};
		case "SOUTHEAST": {_npcdir = 135;};
		case "SOUTH": {_npcdir = 180;};
		case "SOUTHWEST": {_npcdir = 225;};
		case "WEST": {_npcdir = 270;};
		case "NORTHWEST": {_npcdir = 315;};
	};
};

_diramb = _npcdir;

_positiontoambush = [_positiontoambush,_diramb, 20] call UPSMON_GetPos2D;
_positiontoambush set [count _positiontoambush,0];			
_roads = _positiontoambush nearRoads 100;


if (count _roads > 0) then 
{
	_roads = [_roads, [], { _positiontoambush vectorDistance getposATL _x}, "ASCEND"] call BIS_fnc_sortBy;
			
	// Thanks ARJay
	_roadConnectedTo = roadsConnectedTo (_roads select 0);
	_connectedRoad = _roadConnectedTo select 0;
	_diramb = [(_roads select 0), _connectedRoad] call BIS_fnc_DirTo;
	If ((_npcdir < 180 && _diramb  > (_npcdir + 90)) || (_npcdir > 180 && _diramb  < (_npcdir - 90))) then {_diramb = _diramb +180;diag_log format ["Min2: %1 Max2: %2 %3 %4",_npcdir,_diramb,(_npcdir < 180 && _diramb  > (_npcdir + 90)),(_npcdir > 180 && _diramb  < (_npcdir - 90))];};
	_positiontoambush = getposATL (_roads select 0);
};	

//Puts a mine if near road
if ( UPSMON_useMines && _ambushType == 1 ) then 
{	
	if (UPSMON_Debug>0) then 
	{
		player sidechat format["%1: Putting mine for ambush",_grp getvariable ["UPSMON_grpid",0]];
		diag_log format["UPSMON %1: Putting mine for ambush",_grp getvariable ["UPSMON_grpid",0]];
		diag_log format["%1: Roads #:%2 Pos:%3 Dir:%4",_grp getvariable ["UPSMON_grpid",0], _roads,_positiontoambush,_npcdir]
	}; 	

	_minetype1 = UPSMON_Minestype1 call BIS_fnc_selectRandom;
	_minetype2 = UPSMON_Minestype2 call BIS_fnc_selectRandom;
				
	switch (_Minestype) do 
	{
		case "1": {_minetype2 = _minetype1;};
		case "2": {_minetype2 = _minetype2;};
		case "3": {_minetype1 = _minetype2;};
	};
			
	[_Mines,_minetype1,_minetype2,_positiontoambush,_diramb,side _npc] spawn UPSMON_spawnmines;				
				
};
	
[_npc,_diramb,_positiontoambush,_ambushdist] spawn UPSMON_SetAmbush;
sleep 1;	
	
_positiontoambush
