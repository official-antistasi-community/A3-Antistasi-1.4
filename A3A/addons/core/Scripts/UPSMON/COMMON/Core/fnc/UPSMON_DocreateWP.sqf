/****************************************************************
File: UPSMON_DocreateWP.sqf
Author: Azroul13

Description:
	Create waypoint for group
Parameter(s):
	<--- group
	<--- position of the waypoint
	<--- type of the waypoint
	<--- Formation of the waypoint
	<--- Behaviour of the waypoint
	<--- Combatmode of the waypoint
	<--- Radius of the waypoint
Returns:
	Nothing
****************************************************************/
private ["_grp","_targetpos","_wptype","_wpformation","_speedmode","_wp1","_radius","_CombatMode"];
	
_grp = _this select 0;
_targetpos = _this select 1;
_wptype = _this select 2;
_wpformation = _this select 3;
_speedmode = _this select 4;
_Behaviour = _this select 5;
_CombatMode = _this select 6;
_radius = _this select 7;
	
_grp call UPSMON_DeleteWP;
	
_wp1 = _grp addWaypoint [_targetPos,0];
_wp1  setWaypointPosition [_targetPos,0];
_wp1  setWaypointType _wptype;
_wp1  setWaypointFormation _wpformation;		
_wp1  setWaypointSpeed _speedmode;
_wp1  setwaypointbehaviour _Behaviour;
_wp1  setwaypointCombatMode _CombatMode;
_wp1  setWaypointLoiterRadius _radius;
//if (count _this > 8) then {sleep 3; (vehicle (leader _grp)) flyinheight (_this select 8)};

_grp setCurrentWaypoint [_grp,(_wp1 select 1)];