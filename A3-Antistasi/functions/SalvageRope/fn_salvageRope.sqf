private _filename = "fn_salvageRope.sqf";

//Deploy action
A3A_SR_canDeployWinch = { //can deploy winch if player is not in a vehicle, is within 10m, theres no rope deployed yet and the vehicle can load cargo
    private _vehicle = cursorTarget;
    if (_vehicle isKindOf "Ship") then {
        vehicle player == player && player distance _vehicle < 10 && isNil {_vehicle getVariable "WinchRope"} && [_vehicle, boxX] call jn_fnc_logistics_canLoad != -3;
    } else {
        false;
    };
};

A3A_SR_DeployWinch = {
    if (captive player) then {player setCaptive false};
    params ["_player"];
    private _vehicle = cursorTarget;
    private _helper = "Land_Can_V1_F" createVehicle [random 100,random 100, random 100];
    _helper hideObjectGlobal true;
    _helper attachTo [_player,[0,0.1,0], "pelvis"];
    _vehicle setVariable ["WinchRope", (ropeCreate [_vehicle, [0,-2.8,-0.8], _helper, [0,0,0], 10]), true];
    _vehicle setVariable ["WinchHelper", _helper, true];
    player setVariable ["WinchHelperObj", _helper];
    [_player, _vehicle] spawn A3A_SR_adjustRope;
};

A3A_SR_adjustRope = {
    params ["_player", "_vehicle"];
    while {!isNil {_vehicle getVariable "WinchRope"}} do {
        private _rope = _vehicle getVariable "WinchRope";
        private _dist = _vehicle distance _player;
        private _optimalDist = _dist + 3;
        private _maxDist = _dist + 7;
        if ((ropeLength _rope) < _dist) then {
            ropeUnwind [_rope, 10, _optimalDist];
        } else {
            if ((ropeLength _rope) > _maxDist) then {
                ropeUnwind [_rope, 10, _optimalDist];
            };
        };
        sleep 0.1;
    };
};

//Stow action
A3A_SR_canStow = { //can stow when the player is not in a vehicle, is within 10m, rope attached to the player or no one, not recovering cargo
    private _vehicle = cursorTarget;
    if (isNull _vehicle) exitWith {false};
    if !(isNil {_vehicle getVariable "WinchRope2"}) exitWith {false};
    private _attachedPlayer = attachedTo (_vehicle getVariable ["WinchHelper", objNull]);
    if (isNull _attachedPlayer) exitWith {false}; //winch not deployed
    vehicle player == player && player distance _vehicle < 10 && (!alive _attachedPlayer || player == _attachedPlayer); //only attached player unless dead
};

A3A_SR_stowRope = {
    params ["_player"];
    private _vehicle = cursorTarget;
    ropeDestroy (_vehicle getVariable "WinchRope");
    _helper = _vehicle getVariable "WinchHelper";
    detach _helper;
    deleteVehicle _helper;
    _vehicle setVariable ["WinchRope",nil,true];
    _vehicle setVariable ["WinchHelper",nil,true];
    player setVariable ["WinchHelperObj", objNull];

};

//Attach action
A3A_SR_canAttach = { //whitelisted objs (SalvageCrate) thats within 13m (finicky with low distance) and thats under water can be attached while the player has a rope
    _cargo = cursorTarget;
    if (isNull _cargo) exitWith {false};
    if !(_cargo getVariable ["SalvageCrate", false]) exitWith {false}; //not whitelisted
    if ((getPosASLW _cargo#2)>0) exitWith {false}; //above water
    private _helper = player getVariable ["WinchHelperObj", objNull];//get helper from player
    player distance _cargo <= 13 && !isNull(ropeAttachedTo _helper); //close enough and has rope
};

A3A_SR_attachRope = {
    private _cargo = cursorTarget;
    private ["_vehicle"];
    private _helper = player getVariable ["WinchHelperObj", objNull];
    _vehicle = ropeAttachedTo _helper;
    player setCaptive false;
    private _distance = _vehicle distance _cargo;
    private _unwind = _distance - 0.5;
    private _time = 5 + (_unwind*2);
    ropeDestroy (_vehicle getVariable "WinchRope");
    _helper = _vehicle getVariable "WinchHelper";
    detach _helper;
    deleteVehicle _helper;
    _vehicle setVariable ["WinchHelper",nil,true];
    _vehicle setVariable ["WinchRope2", (ropeCreate [_vehicle, [0,-2.8,-0.8], _cargo, [0,0,0], _distance]), true];
    sleep 1;
    ropeUnwind [ropes _vehicle select 0, 0.5, -(_unwind), true];
    _vehicle lockCargo true;
    sleep _time;
    ropeDestroy (_vehicle getVariable "WinchRope2");
    [_vehicle, _cargo] call jn_fnc_logistics_load;
    _cargo call jn_fnc_logistics_addAction;
    _vehicle setVariable ["WinchRope2",nil,true];
    _vehicle setVariable ["WinchRope",nil,true];
};

//adding of actions
A3A_SR_addplayerWinchActions = {
    player addAction ["Deploy Winch", {
        [player] call A3A_SR_DeployWinch;
    }, nil, 0, false, true, "", "call A3A_SR_canDeployWinch"];

    player addAction ["Stow Winch", {
        [player] call A3A_SR_stowRope;
    }, nil, 0, false, true, "", "call A3A_SR_canStow"];

    player addAction ["Attach Rope", {
        [player] spawn A3A_SR_attachRope;
    }, nil, 0, false, true, "", "call A3A_SR_canAttach"];

    if (isMultiplayer) then {
        player addEventHandler ["Respawn",{
            player setVariable ["SalvageRopeAction",false];
        }];
    };
};

[] spawn {
    private _missionComplete = false;
    while {!_missionComplete} do {
        if (!isNull player && isplayer player) then {
            if !(player getVariable ["SalvageRopeAction",false]) then {
                [] call A3A_SR_addplayerWinchActions;
                player setVariable ["SalvageRopeAction",true];
            };
        };
        sleep 2;
        _missionComplete = "LOG" call BIS_fnc_taskCompleted;
    };
};
