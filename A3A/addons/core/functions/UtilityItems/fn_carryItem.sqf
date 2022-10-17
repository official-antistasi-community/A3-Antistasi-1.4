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
        if (isNil "_objectCarrying") exitwith {_unit removeEventHandler ["GetInMan", _thisEventHandler]};

        //remove object and find safe placement
        detach _objectCarrying;
        _unit setVelocity [0,0,0];
        _objectCarrying setVelocity [0,0,0];
        _objectCarrying setVehiclePosition [position _unit, [], 10,"NONE"];

        [_objectCarrying, true] remoteExec ["enableSimulationGlobal", 0];
        


        _unit setVariable ["A3A_carryingObject", nil];
        _unit setVariable ['A3A_objectCarrying', nil];
        _unit allowSprint true;
        

    }];

    if (isNil {_item getVariable "A3A_originalMass"}) then { _item setVariable ["A3A_originalMass", getMass _item] };
    [_item, 1e-12] remoteExecCall ["setMass", 0]; 

    _player setVariable ['A3A_eventIDcarry', _eventIDcarry];
    _player setVariable ['A3A_objectCarrying', _item];

    // prevent killing players with item
    [_item, false] remoteExec ["enableSimulationGlobal", 2];
    private _bbReal = boundingBoxReal _item;
    private _diff = (_bbReal select 1) vectorDiff (_bbReal select 0);
    private _positionAttached = [0, (_diff vectorDotProduct [0,.65,0]) + 1.0, (_diff vectorDotProduct [0,0,0.5]) + 0.5];
    _item attachTo [_player, _positionAttached, "Chest"];
    _player setVariable ["A3A_carryingObject", true];
    [_player ,_item] spawn {
        params ["_player", "_item"];
        waitUntil {_player allowSprint false; !alive _item or !(_player getVariable ["A3A_carryingObject", false]) or !(vehicle _player isEqualTo _player) or _player getVariable ["incapacitated",false] or !alive _player or !(isPlayer attachedTo _item) };
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
        [_item, true] remoteExec ["enableSimulationGlobal", 2];
        _eventIDcarry = _player getVariable 'A3A_eventIDcarry';
        _player removeEventHandler ["GetInMan", _eventIDcarry];

        _item spawn {
            sleep 1;
            if (isNull _this) exitWith {};
            // Restore original _item mass. This one can be slow.
            [_this, _this getVariable "A3A_originalMass"] remoteExecCall ["setMass", _this];
        };
    };
    _player setVariable ["A3A_carryingObject", nil];
    _player allowSprint true;
};