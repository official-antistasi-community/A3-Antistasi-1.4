/*
Author: Killerswin2
    Handles unpacking objects and converting them to the correct type
Arguments:
    0.<Object> Object that we are converting
Return Value:
    <nil>
Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 
Example:
    [_object] call A3A_Logistics_fnc_unpackObject; 
*/
#include "..\script_component.hpp"

params  [
    ["_object", objNull, [objNull]]
];

// don't unpack if attached.
if !(isNull attachedTo _object) exitWith {};

//get data 
private _itemClassName = _object getVariable "A3A_packedObject";
if (isNil "_itemClassName") exitwith { Error_1("No packed object for item type %1", typeof _object) };

private _fnc_placed = {
    params ["_item", "_oldItem"];
    if (isNull _item) exitWith { _oldItem hideObject false };          // placement cancelled
 
    deleteVehicle _oldItem;
    _item call A3A_fnc_initObject;
};

_object hideObject true;
[_itemClassName, _fnc_placed, {[false]}, [_object]] call HR_GRG_fnc_confirmPlacement;
