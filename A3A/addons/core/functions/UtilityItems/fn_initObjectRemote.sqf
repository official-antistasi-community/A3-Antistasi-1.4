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
#include "..\..\script_component.hpp"
params[["_object", objNull, [objNull]],["_jipKey", "", [""]], ["_itemType", -1]];


if (isNull _object) exitwith {remoteExec ["", _jipKey]};
if(_itemType isEqualTo -1) exitWith {remoteExec ["", _jipKey]};
	
// movable object
if (([_itemType, MOVE_OBJ] call BIS_fnc_bitwiseAND) > 0) then 
{
	[_object, _jipKey] call A3A_fnc_initMovableObject;
};

// loot crate object
if (([_itemType, LOOT_CRATE] call BIS_fnc_bitwiseAND) > 0) then 
{
	[_object, _jipKey] call A3A_fnc_initLootToCrate;
};

// packable object
if (([_itemType, PACKABLE] call BIS_fnc_bitwiseAND) > 0) then 
{
	[_object, _jipKey] call A3A_Logistics_fnc_initPackableObjects;
};

// loadable object from logistic system.
if(([_itemType, LOADABLE] call BIS_fnc_bitwiseAND) > 0) then 
{
	
	if (([_object] call A3A_Logistics_fnc_getCargoNodeType) isEqualTo -1) exitWith {
		Error_1("tried to add action to unsupported object type. Type: %1",typeOf _object);
		nil
	};
	
	[_object , "load"] remoteExec ["A3A_Logistics_fnc_addAction", 0, _object];
};

nil
