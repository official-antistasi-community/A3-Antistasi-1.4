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
    1. <Array> Callback owner, and the callback arguments
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
params [["_vehicle", objNull, [objNull]], ["_callback",[], [[]]], ["_action", ""]];
_callback params [["_callBackName", "", [""]], ["_arguments", []] ];

switch _callBackName do {

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
                switch (build_type) do { //return inverted here so true = cant place
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

    case "SquadVehicle": {
        switch _action do {
            case "Placed": {
                //passed group as argument
                [_vehicle, teamPlayer] call A3A_fnc_AIVEHinit;
                [_vehicle] spawn A3A_fnc_vehDespawner;
                _arguments addVehicle _vehicle;
                _vehicle setVariable ["owner",_arguments,true];
                private _cost = [typeOf _vehicle] call A3A_fnc_vehiclePrice;
                [0, - _cost] remoteExec ["A3A_fnc_resourcesFIA",2];
                leader _arguments assignAsDriver _vehicle;
                {[_x] orderGetIn true; [_x] allowGetIn true} forEach units _arguments;
                ["Recruit Squad", "Vehicle Purchased"] call A3A_fnc_customHint;
                petros directSay "SentGenBaseUnlockVehicle";
            };
            default {false};
        };
    };

    default {false};
};
