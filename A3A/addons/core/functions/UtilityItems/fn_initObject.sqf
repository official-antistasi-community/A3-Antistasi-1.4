/*
Author: Killerswin2
    function wrapper that inits objects addActions for subsystems
Arguments:
    0.<Object> Object that we try to add actions to 
    1.<array> params to pass
	
	Return Value:
    <nil>
	
	Scope: Clients
	Environment: Unscheduled
	Public: No
	Dependencies: 
	
	Example:
    [_object, _type] call A3A_fnc_initObject; 
*/
#include "..\..\script_component.hpp"
params[["_object", objNull, [objNull]], ["_itemType", -1]];

private _jipKey = "A3A_initObject_" + ((str _object splitString ":") joinString "");

if (_itemType isNotEqualTo -1) then 
{
	[_object, _jipKey, _itemType] remoteExec ["A3A_fnc_initObjectRemote", 0, _jipKey]; 
};
