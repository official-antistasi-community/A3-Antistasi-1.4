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
    ["Packing Objects", "refunding money to do error"] call A3A_fnc_customHint;
    [_price] call A3A_fnc_resourcesPlayer;
};
private _position = (getPos player vectorAdd [3,0,0]) findEmptyPosition [1, 25, _itemClassName];
if (_position isEqualTo []) then {_position = getPos player };
private _item = _itemClassName createVehicle _position;
_item allowDamage false;



_item setVariable ["A3A_canGarage", true, true];
_item setVariable ["A3A_itemPrice", _price, true];
_item setVariable ["A3A_canOpenDoor", _canOpenDoors, true]; 



// add logi
if (_item call A3A_Logistics_fnc_isLoadable) then {
    [_item] call A3A_Logistics_fnc_addLoadAction;
};

private _jipKey = "A3A_utilityItems_item_" + "A3A_fnc_initMovableObject" + "_" + ((str _item splitString ":") joinString "");
[_item, _jipKey] remoteExecCall ["A3A_fnc_initMovableObject", 0, _jipKey];
[_item, _jipKey] remoteExecCall ["A3A_Logistics_fnc_initPackableObjects", 0, _jipKey];
if(_canOpenDoors) then {
    [_item, _jipKey] remoteExecCall ["A3A_fnc_openDoorsTent", 0, _jipKey];
};

//delete object
deleteVehicle _object;