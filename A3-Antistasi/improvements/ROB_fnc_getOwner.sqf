/*
file: ROB_fnc_getOwner.sqf
by DaVidoSS
part of system which adds auto loot collector
created for Barbolani's Antistasi
parameters:
0: OBJECT 
return VOID
*/
params[ ["_object",objNull,[objNull]] ];
	
if !(isServer) exitWith {};
private _owner = owner _object;
_object setVariable ["my_owner",_owner,true];
