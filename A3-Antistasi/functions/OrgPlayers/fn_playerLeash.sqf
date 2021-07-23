/*
Maintainer: Caleb Serafin
    If the current player is not a member, it will loop every 60 seconds to check the distance from the player to HQ or any member.
    However, if there are no members online, it will allow the player unlimited distance from HQ.
    If there is a member online, it will warn the player and begin a 61 second countdown

Return Value:
    <ANY> Undefined

Scope: Clients, Global Effect
Environment: Scheduled
Public: No (Only spawned once in initClient)
Dependencies:
    <SCALAR> memberDistance
    <SIDE> teamPlayer

Example:
    [] spawn A3A_fnc_playerLeash;

    // Following snippet is used to debug after the game has initialised:
    membershipEnabled = true;
    memberDistance = 100;
    membersX deleteAt (membersX find getPlayerUID player);
    A3A_DEV_playerLeash_debug = true;
    [] spawn A3A_fnc_playerLeash;
*/

#define INITIAL_COUNT_TIME 61
private _debugMode = !isNil "A3A_DEV_playerLeash_debug";

// -1 is used to represent unlimited distance.
if (memberDistance <= 0) exitWith {};

_countX = INITIAL_COUNT_TIME;
// Membership is rechecked in the case that a temporary membership is granted.
while {!([player] call A3A_fnc_isMember) || _debugMode} do {
    // A switch statement would require all the variables and lists used in the comparison to always be calculated.
    // By using sequential if-exits, the cheaper and frequently true checks can be done first.
    private _withinLeash = call {
        // Check distance to HQ flag.
        if (player distance2D getMarkerPos respawnTeamPlayer <= memberDistance) exitWith {true};

        // If there are no members online, allow unlimited distance.
        private _playerMembers = (call A3A_fnc_playableUnits) select {([_x] call A3A_fnc_isMember) and (side group _x == teamPlayer)};
        if (count _playerMembers == 0 && !_debugMode) exitWith {true};

        // Else find the closest member and check the distance.
        _closestMember = [_playerMembers,player] call BIS_fnc_nearestPosition;
        if (player distance2D _closestMember <= memberDistance) exitWith {true};

        // The player is being FF punished.
        if (!isNil "A3A_FFPun_Jailed" && {(getPlayerUID player) in A3A_FFPun_Jailed}) exitWith {true};

        // No leash exemptions were found.
        false;
    };

    if (_withinLeash) then {
        // Reset timer.
        _countX = INITIAL_COUNT_TIME;
        if (_debugMode) then {
            [serverTime + 60] spawn {
                while {_this#0 - serverTime > 0} do {
                    systemChat ("Next player leash check in " + ((_this#0 - serverTime) toFixed 0) + " sec");
                    uiSleep 5;
                };
            }
        };
        uiSleep 60;
    } else {
        // Decrement timer.
        _countX = _countX - 1;
        // Show player a countdown warning.
        ["Maximum Distance", format ["You must be within %1 Km of the HQ marker or a member. <br/><br/> After <t color='#f0d498'>%2</t> seconds you will be teleported to your HQ. Driven vehicle will be included.", (memberDistance/1e3) toFixed 1, _countX]] call A3A_fnc_customHint;
        uiSleep 1;
        if (_countX <= 0) then {
            // Teleport the vehicle as well to avoid it becoming stranded and unobtainable by the player.
            private _possibleVehicle = vehicle player;
            if (_possibleVehicle != player && (driver _possibleVehicle) == player) then {
                [_possibleVehicle] call A3A_fnc_teleportVehicleToBase;
            };
            player setPos (getMarkerPos respawnTeamPlayer);
        };
    };
};
