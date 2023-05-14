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
    [_object, _jipKey] remoteExec [A3A_fnc_initObjectRemote, _jipKey]; 
*/
#include "..\..\script_component.hpp"

params [["_object", objNull, [objNull]],["_jipKey", "", [""]]];

// If object no longer exists, clear the JIP entry
if (isNull _object) exitwith {remoteExec ["", _jipKey]};

// Wait until client init is complete so that all the subsystems (inc buyableItemHM) are ready
if (isNil "initClientDone") then {
	waitUntil {sleep 1; !isNil "initClientDone"};
};

private _flags = (A3A_buyableItemHM get typeof _object) # 4;

// movable object
if ("move" in _flags) then {
	[_object] call A3A_fnc_initMovableObject;
};

// loot crate object
if ("loot" in _flags) then {
	[_object] call A3A_fnc_initLootToCrate;
};

// packable object
if ("pack" in _flags) then {
	[_object] call A3A_Logistics_fnc_initPackableObjects;
};

nil
