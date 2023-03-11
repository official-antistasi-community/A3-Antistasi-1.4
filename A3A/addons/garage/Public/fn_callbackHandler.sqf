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
                _vehicle setFuel random [0.10, 0.175, 0.25];
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

    case "HCSquadVehicle": {
        switch _action do {
            case "invalidPlacement": {
                [getMarkerPos respawnTeamPlayer distance _vehicle > 50, "You cant place HC vehicles further than 50m from HQ"];
            };
            case "Placed": {
                (_arguments + [_vehicle]) spawn A3A_fnc_spawnHCGroup;
            };
            default {false};
        };
    };

    case "LARGEITEM":
    {
        switch _action do {
            case "Placed":
            {
                _arguments params  [
                    ["_unit", objNull, [objNull]],
                    ["_spawnItem", "", [""]],       // easier to keep the format from the buyitem then writing a new one
                    ["_price", -1, [0]],
                    ["_callbacks", [], [[]]]
                ];

                private _lastTimePurchase = _unit getVariable["A3A_spawnItem_cooldown",time];
                if (_lastTimePurchase > time) exitwith {["Item Purchase", format ["You already bought one, wait %1 seconds before you can buy another.", ceil (_lastTimePurchase - time)]] call A3A_fnc_customHint; deleteVehicle _vehicle;};

                if (_price != 0) then {
                    //try to take money away 😞
                    private _insufficientFunds = isNil {
                        if (_unit == theBoss && (server getVariable ["resourcesFIA", 0]) >= _price) then {
                            [0,(-_price)] remoteExec ["A3A_fnc_resourcesFIA",2];
                            true;
                        } else {
                            if ((_unit getVariable ["moneyX", 0]) >= _price) then {
                                [-_price] call A3A_fnc_resourcesPlayer;
                                true;
                            };
                        };
                    };
                    if (_insufficientFunds) exitwith {["Item Purchase", "You can't afford this Item."] call A3A_fnc_customHint};
                };

                _unit setVariable ["A3A_spawnItem_cooldown", time + 15];
                
                //object globals
                _vehicle setVariable ["A3A_canGarage", true, true];
                _vehicle setVariable ["A3A_itemPrice", _price, true];
        
                // callbacks
                {
                    private _func_name = (_x #0);
                    if (_x #1) then {
                            private _jipKey = "A3A_utilityItems_item_" + _func_name + "_" + ((str _vehicle splitString ":") joinString "");
                            [_vehicle, _jipKey] remoteExecCall [_func_name, 0, _jipKey];
                    } else {
                        [_vehicle] call (missionNamespace getVariable _func_name);
                    };
                } foreach (_callbacks);
            };
            default {false};
        };
    };

    default {false};
};
