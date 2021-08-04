/*
    Author: [Håkon]
    Description:
        Meant to handle outside use of placement code, will trigger callbacks for event _callback passed, for the internal actions of the placement code.

        Important, always default to false.

        Actions:            | Return    | Description
        invalidPlacement    | Bool      | If can place, return false for can place
        Placed              | Nil       | Vehicle placed, gives you chance to do custom stuff


    Arguments:
    0. <Object> Vehicle
    1. <String> Callback owner
    2. <String> Callback action

    Return Value:
    <Bool/Nil> Callback succesfull

    Scope: Any
    Environment: Any
    Public: No
    Dependencies:

    Example:

    License: MIT
*/
params [["_vehicle", objNull, [objNull]], ["_callback",""], ["_action", ""]];

switch _callback do {

    case "BUYFIA": {
        switch _action do {

            case "Placed": {
                if (player == theBoss) then {
                    [0,(-1 * vehiclePurchase_cost)] remoteExec ["A3A_fnc_resourcesFIA",2];
                } else {
                    [-1 * vehiclePurchase_cost] call A3A_fnc_resourcesPlayer;
                    _vehicle setVariable ["ownerX",getPlayerUID player,true];
                };
                vehiclePurchase_cost = 0;
            };

            default {false};
        };
    };

    case "BUILDSTRUCTURE": {
        switch _action do {

            case "invalidPlacement": {
                switch (build_type) do { //return inverted here so true = can place
                    case "RB": {
                        [!(isOnRoad _vehicle), "Roadblocks can only be built on roads"];
                    };
                    case "SB": {
                        [(isOnRoad _vehicle) || {!(_vehicle inArea build_nearestFriendlyMarker)}, "Bunkers can only be built off roads, in friendly areas"];
                    };
                    case "CB": {
                        [(isOnRoad _vehicle) || {!(_vehicle inArea build_nearestFriendlyMarker)}, "Bunkers can only be built off roads, in friendly areas"];
                    };
                    default { false };
                };
            };

            case "Placed": {
                private _type = typeOf _vehicle;
                private _pos = getPosASL _vehicle;
                private _dir = getDir _vehicle;
                deleteVehicle _vehicle;
                [_type, _pos, _dir] spawn A3A_fnc_buildCreateVehicleCallback;
            };
            default {false};
        };
    };

    default {false};
};
