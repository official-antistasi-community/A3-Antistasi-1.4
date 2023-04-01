/*
Author: Killerswin2
    function remote wrapper that inits objects addActions for subsystems
Arguments:
    0.<Object> Object that we try to add actions to 
    1.<String> Custom JIP key to prevent overwriting 
	
	Return Value:
    <nil>
	
	Scope: Clients
	Environment: Unscheduled
	Public: No
	Dependencies: 
	
	Example:
    [_object, _jipKey, _params] remoteExec [A3A_fnc_initObjectRemote, _jipKey]; 
	*/
	
params[["_object", objNull, [objNull]],["_jipKey", "", [""]], ["_params", []]];

if(_params isEqualTo []) exitWith {}; 

_params params [ ["_isMovableObject", false], ["_isLootCrate", false], ["_isPackable", false]];
if (isNull _object) exitwith {remoteExec ["", _jipKey];};
	
if(_isMovableObject) then {[_object, _jipKey] call A3A_fnc_initMovableObject;};
if(_isLootCrate && LootToCrateEnabled) then {[_object, _jipKey] call A3A_fnc_initLootToCrate;};
if(_isPackable) then {[_object, _jipKey] call A3A_Logistics_fnc_initPackableObjects;};

nil;