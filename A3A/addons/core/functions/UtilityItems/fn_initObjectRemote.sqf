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
#include "objInitDefines.hpp"
params[["_object", objNull, [objNull]],["_jipKey", "", [""]], ["_itemType", -1]];

if(_params isEqualTo []) exitWith {}; 

if (isNull _object) exitwith {remoteExec ["", _jipKey];};
if(_itemType isEqualTo -1) exitWith {remoteExec ["", _jipKey];}
	
switch (_itemType) do {
	case MOVE_OBJ: { [_object, _jipKey] call A3A_fnc_initMovableObject;};
	case LOOT_CRATE: { [_object, _jipKey] call A3A_fnc_initLootToCrate;};
	case PACKABLE: { [_object, _jipKey] call A3A_Logistics_fnc_initPackableObjects;};

	case (MOVE_OBJ+LOOT_CRATE): {
		[_object, _jipKey] call A3A_fnc_initMovableObject;
		[_object, _jipKey] call A3A_fnc_initLootToCrate;		
	};
	case (MOVE_OBJ+PACKABLE): {
		[_object, _jipKey] call A3A_fnc_initMovableObject;
		[_object, _jipKey] call A3A_Logistics_fnc_initPackableObjects;
	};
	case (LOOT_CRATE+PACKABLE): {
		[_object, _jipKey] call A3A_fnc_initLootToCrate;
		[_object, _jipKey] call A3A_Logistics_fnc_initPackableObjects;
	};
	case (MOVE_OBJ+LOOT_CRATE+PACKABLE): {
		[_object, _jipKey] call A3A_fnc_initMovableObject;
		[_object, _jipKey] call A3A_fnc_initLootToCrate;
		[_object, _jipKey] call A3A_Logistics_fnc_initPackableObjects;
	};

	default { 
		// how did you get here
	};
};

nil;