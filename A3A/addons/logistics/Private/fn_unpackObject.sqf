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
if(!(isNull attachedTo _object)) exitWith {};


//get data 
private _price = _object getVariable ["A3A_itemPrice", 0];
private _canOpenDoors = _object getVariable ["A3A_canOpenDoor", false];
private _itemClassName = _object getVariable ["A3A_packedObject", ""];

// refund if error
if(_itemClassName isEqualTo "") exitwith {
    [localize "STR_A3A_Packable_Objects_Title", localize "STR_A3A_Packable_Objects_refunding_error"] call A3A_fnc_customHint;
    [_price] call A3A_fnc_resourcesPlayer;
};
private _item = _itemClassName createVehicle [0,0,0];
_item allowDamage false;

_callBacks = [['A3A_fnc_initObject', false, MOVE_OBJ + PACKABLE]];

if(_canOpenDoors) then {
    _callBacks pushBack ['A3A_fnc_openDoorsTent', true];
};

// add logi
if (_item call A3A_Logistics_fnc_isLoadable) then {
    _callBacks pushBack ['A3A_Logistics_fnc_addLoadAction', false];
};

[ _itemClassName, "LARGEITEM", [player, _itemClassName, 0, _callBacks, _object]] call HR_GRG_fnc_confirmPlacement;

deleteVehicle _item;
