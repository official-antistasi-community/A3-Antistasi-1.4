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

    // we need to prevent the player from carrying an object into a vehicle to prevent damage to vehicle
    private _eventIDcarry = _player addEventHandler ["GetInMan", {
        params ["_unit", "_role", "_vehicle", "_turret"];
        // get variables
        private _objectCarrying = _unit getVariable ['A3A_objectCarrying', nil];

        //remove object and find safe placement
        private _pos = [_unit, 1, 10, 3, 0, 20, 0] call BIS_fnc_findSafePos;

        detach _objectCarrying;
        _unit setVelocity [0,0,0];
        _objectCarrying setVelocity [0,0,0];
        _objectCarrying setPos [_pos # 0, _pos # 1 , 0];

        _objectCarrying enableSimulationGlobal true;


        _unit setVariable ["A3A_carryingObject", nil];
        _unit setVariable ['A3A_objectCarrying', nil];
        _unit removeEventHandler ['GetIn', _thisEventHandler];

    }];

    _player setVariable ['A3A_eventIDcarry', _eventIDcarry];
    _player setVariable ['A3A_objectCarrying', _item];

    _item enableSimulationGlobal false; // prevent killing players with item
    _item attachTo [_player, [0, 1.5, 0.5], "Chest"];
    _player setVariable ["A3A_carryingObject", true];
    [_player ,_item] spawn {
        params ["_player", "_item"];
        waitUntil {!alive _item or !(_player getVariable ["A3A_carryingObject", false]) or !(vehicle _player isEqualTo _player) or _player getVariable ["incapacitated",false] or !alive _player or !(isPlayer attachedTo _item) };
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
        _item enableSimulationGlobal true;
        _player removeEventHandler ["GetInMan", _player getVariable ['A3A_eventIDcarry']];
    };
    _player setVariable ["A3A_carryingObject", nil];
};