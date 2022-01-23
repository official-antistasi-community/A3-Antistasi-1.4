/****************************************************************
File: UPSMON_domove.sqf
Author: MONSADA

Description:
	Mueve al soldierX adelante
Parameter(s):
	<--- unit
	<--- Distance
Returns:
	nothing
****************************************************************/
private["_npc","_dir1","_targetPos","_dist"];	

_npc = _this select 0;
_dist = _this select 1;
if ((count _this) > 2) then {_dir1 = _this select 2;} else{_dir1 = getDir _npc;};
	
sleep 0.05;	
if (!alive _npc  || !canmove _npc ) exitwith{};
	
_targetPos = [position _npc,_dir1, _dist] call UPSMON_GetPos2D;		
//If position water and not boat, plane nor diver no go
	
if (surfaceIsWater _targetPos && { !( _npc iskindof "boat" || _npc iskindof "air" || ["diver", (typeOf (leader _npc))] call BIS_fnc_inString ) } ) exitwith 
{
	if (UPSMON_Debug>0) then { 
		diag_log format ["UPSMON 'UPSMON_domove' exit: targetPos is water: [%1] - [%2] - [%3]", _npc iskindof 'boat', _npc iskindof 'air', ['diver', (typeOf (leader _npc))] call BIS_fnc_inString];
	};
};	
_npc doMove _targetPos;	