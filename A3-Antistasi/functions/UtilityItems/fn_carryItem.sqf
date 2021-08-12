/*
Author: Killerswin2, Hakon
    trys to carry an object to a place
Arguments:
    0.<Object>  object that will carried;
    1.<Bool>    bool that determines if the object will be picked up
    2.<Object>  player that calls or holds object (optional)
Return Value:
    <nil>

Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 

Example:
    [cursorObject] call A3A_fnc_carryItem; 

Note: 
    might rewrite to were the objects get recreated, becuase the object can drop or stand still.
    If that is done. Don't call the function if an item as cargo, as that is not saved.
    might use setVehiclepos
*/


params [["_item", objNull], "_pickUp", ["_player", player]];

if (_pickUp) then {
    if (([_player] call A3A_fnc_countAttachedObjects) > 0) exitWith {systemChat "you are already carrying something."};
    _item attachTo [_player, [0, 1.5, 0], "Chest"];
    _player setVariable ["carryingLight", true];
    [_player ,_item] spawn {
        params ["_player", "_item"];
        waitUntil {_player forceWalk true; !alive _item or !(_player getVariable ["carryingLight", false]) or !(vehicle _player isEqualTo _player) or _player getVariable ["incapacitated",false] or !alive _player or !(isPlayer attachedTo _item) };
        [_item, false, _player] call A3A_fnc_carryItem;
    };
} else {
    //re-add item if null
    if (isNull _item) then {
        private _attached = (attachedObjects _player)select {(typeOf _x) isEqualTo "vehicleLightSource"};
        if (_attached isEqualTo []) exitWith {};
        _item = _attached # 0;
    };
    if !(isNull _item) then {
        _player setVelocity [0,0,0];
        detach _item;
        _item setVelocity [0,0,0];
        // fixes height issue
        _item setPosATL [(getPosATL _item # 0) , (getPosATL _item # 1) , 0];
    };
    _player setVariable ["carryingLight", nil];
    _player forceWalk false;
};