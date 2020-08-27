/*
file: ROB_fnc_remRobAction.sqf
by DaVidoSS
part of system which adds auto loot collector
created for Barbolani's Antistasi
parameters:
0: OBJECT 
return VOID
*/
params[ ["_object",objNull,[objNull]] ];
	
if (hasInterface) then {
	
	private _actionID = _object getVariable [ "RobAction", -1 ];
	if ( _actionID > -1 ) then {
		_object removeAction _actionID;
	};
};