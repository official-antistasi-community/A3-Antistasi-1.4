/****************************************************************
File: UPSMON_Dofindstatic.sqf
Author: Azroul13

Description:
	Search for near combat statics.

Parameter(s):
	<--- leader
	<--- Id of the group
Returns:
	nothing
****************************************************************/
private ["_npc","_unitsIn","_grpid","_buildingdist"];
_npc = _this select 0;
_grpid = _this select 1;
_buildingdist = _this select 2;
	
//If use statics are enabled leader searches for static weapons near.
_unitsIn = [_grpid,_npc,_buildingdist] call UPSMON_GetIn_NearestStatic;			
				
if ( count _unitsIn > 0) then 
{									
	_npc setspeedmode "FULL";					
	_timeout = time + 60;
					
	{ 
		waituntil {vehicle _x != _x || { time > _timeout } || { movetofailed _x } || { !canmove _x } || { !alive _x } }; 
	} foreach _unitsIn;
};