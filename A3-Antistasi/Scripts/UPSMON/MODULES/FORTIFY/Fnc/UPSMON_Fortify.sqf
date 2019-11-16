/****************************************************************
File: UPSMON_unitdefend.sqf
Author: Azroul13

Description:

Parameter(s):
	<--- group
	<--- Distance between group and nearest enemy
	<--- Is supressed? (boolean)
Returns:
	nothing
****************************************************************/

private ["_grp","_units","_npc","_currpos","_dir","_blds","_lookpos","_attackpos"];
	
_grp = _this select 0;
_attackpos = _this select 1;
_units = units _grp;
_npc = leader _grp;
_currpos = getposATL _npc;
_dir = getdir _npc;

_grp  setvariable ["UPSMON_GrpinAction",true];

_unitsin = [_npc,["static"],50,false,""] call UPSMON_GetIn_NearestVehicles;
_units = _units - _unitsin;

If ( count _units > 0 ) then 
{
	_nosmoke = [_grp] call UPSMON_NOSMOKE;
	If (!_nosmoke) then {[units _grp,_attackpos] spawn UPSMON_CreateSmokeCover;};
	sleep 1;
	_units = [_npc,_units,70,9999] call UPSMON_moveNearestBuildings;
	If (count _units > 0) then 
	{
		_lookpos = [_currpos,_dir, 20] call UPSMON_GetPos2D;
		[_currpos,_lookpos,50,false,_units] call UPSMON_fnc_find_cover;
	};
};
_grp  setvariable ["UPSMON_GrpinAction",false];
_grp  setvariable ["UPSMON_Grpmission","FORTIFY"];