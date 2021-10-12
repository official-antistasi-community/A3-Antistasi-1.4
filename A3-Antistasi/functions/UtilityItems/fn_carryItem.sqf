/*
Author: Killerswin2,
    trys to carry an object to a place
Arguments:
    0.<Object>  object that will be carried
    1.<Bool>    bool that determines if the object will be picked up
    2.<Object>  player that calls or holds object (optional)
Return Value:
    <nil>

Scope: Clients
Environment: Unscheduled
Public: yes
Dependencies: 

Example:
    [cursorObject] call A3A_fnc_carryItem; 

*/


params [["_item", objNull, [objNull]], "_pickUp", ["_player", player]];

if (_pickUp) then {
    if (([_player] call A3A_fnc_countAttachedObjects) > 0) exitWith {[localize "STR_A3A_Utility_Title", localize "STR_A3A_Utility_Items_Feedback_Normal"] call A3A_fnc_customHint};
    _item attachTo [_player, [0, 1.5, 0.5], "Chest"];
    _player setVariable ["A3A_carryingObject", true];
    [_player ,_item] spawn {
        params ["_player", "_item"];
        waitUntil {_player forceWalk true; !alive _item or !(_player getVariable ["A3A_carryingObject", false]) or !(vehicle _player isEqualTo _player) or _player getVariable ["incapacitated",false] or !alive _player or !(isPlayer attachedTo _item) };
        [_item, false, _player] call A3A_fnc_carryItem;
    };
} else {
    //re-add item if null
    if (isNull _item) then {
        private _attached = [_player] call A3A_fnc_attachedObjects;
        if (_attached isEqualTo []) exitWith {};
        _item = _attached # 0;
    };
    if !(isNull _item) then {
        _player setVelocity [0,0,0];
        detach _item;
        _item setVelocity [0,0,0];
        _item setPos [getPos _item # 0, getPos _item # 1, 0];
    };
    _player setVariable ["A3A_carryingObject", nil];
    _player forceWalk false;
};