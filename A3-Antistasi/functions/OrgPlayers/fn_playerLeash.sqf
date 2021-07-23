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
    memberDistance = 1000;
    membersX deleteAt (membersX find getPlayerUID player);
    A3A_DEV_playerLeash_debug = true;
    [] spawn A3A_fnc_playerLeash;
*/

#define INITIAL_COUNT_TIME 61
private _countDown = INITIAL_COUNT_TIME;
private _debugMode = !isNil "A3A_DEV_playerLeash_debug";

// -1 is used to represent unlimited distance.
if (memberDistance <= 0) exitWith {};



// Membership is rechecked in the case that a temporary membership is granted.
while {!([player] call A3A_fnc_isMember) || _debugMode} do {
    private _nearestLeashCentre = getPos player;  // Only 2D pos is evaluated. Default to player position when no members or ff punishment is the exemption.

    // A switch statement would require all the variables and lists used in the comparison to always be calculated.
    // By using sequential if-exits, the cheaper and frequently true checks can be done first.
    private _withinLeash = call {
        // The player is being FF punished.
        if (!isNil "A3A_FFPun_Jailed" && {(getPlayerUID player) in A3A_FFPun_Jailed}) exitWith {true};

        // If there are no members online, allow unlimited distance.
        private _playerMembers = call A3A_fnc_playableUnits select {[_x] call A3A_fnc_isMember};
        if (count _playerMembers == 0 && !_debugMode) exitWith {true};


        // By this point no leash exemptions were found.

        private _leashCentres = [];
        _leashCentres pushBack getMarkerPos respawnTeamPlayer;
        _leashCentres append _playerMembers;

        _nearestLeashCentre = [_leashCentres,player] call BIS_fnc_nearestPosition;
        player distance2D _nearestLeashCentre <= memberDistance;  // Final return of whether the player is within leash
    };

    if (_withinLeash) then {
        // Reset timer.
        _countDown = INITIAL_COUNT_TIME;
        // Calculates the time of the next check based on radius and velocity in any direction.
        private _distanceToEdge =  (memberDistance - (player distance2D _nearestLeashCentre));
        // 100km/h is an offroads' top speed on average terrain.
        private _velocity = (speed player max 100) / 3.6;  // Convert Km/h to m/s
        private _nextLeashCheck = 0.75 * _distanceToEdge / _velocity;  // Distance is checked at 75% to accommodate deviation from expected velocity and position.

        if (_debugMode) then {
            [_nextLeashCheck] spawn {
                private _checkTime = serverTime + _this#0;
                while {_checkTime - serverTime > 0} do {
                    systemChat ("Leash check every " + (_this#0 toFixed 0) + " s; Next in " + ((_checkTime - serverTime) toFixed 0) + " s");
                    uiSleep 5;
                };
            }
        };
        uiSleep _nextLeashCheck;
    } else {
        // Decrement timer.
        _countDown = _countDown - 1;
        // Show player a countdown warning.
        private _retreatDistance = (player distance2D _nearestLeashCentre) - memberDistance;
        private _compassDirections = ["N","NE","E","SE","S","SW","W","NW"];
        private _retreatDirection = _compassDirections # ((player getDir _nearestLeashCentre) / 360 * count _compassDirections);

        ["Comrade, we're losing contact!", format ["Retreat <t color='#f0d498'>%1 m %2</t>, within <t color='#f0d498'>%3 s</t>.<br/>Stay within %4 km of HQ or a member. Failure to comply will re-insert you at HQ.", ceil _retreatDistance, _retreatDirection, _countDown, ceil (memberDistance/1e3)]] call A3A_fnc_customHint;
        uiSleep 1;
        if (_countDown <= 0) then {
            // Teleport the vehicle as well to avoid it becoming stranded and unobtainable by the player.
            private _possibleVehicle = vehicle player;
            if (_possibleVehicle != player && (driver _possibleVehicle) == player) then {
                [_possibleVehicle] call A3A_fnc_teleportVehicleToBase;
            };
            player setPos (getMarkerPos respawnTeamPlayer);
        };
    };
};
