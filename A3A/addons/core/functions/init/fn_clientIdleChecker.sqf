/*  Persistent loop to check whether player is idle and pass that information to the server

Scope: Client
Environment: Spawned

Arguments:
    None
*/

#define TIMEOUT_AFK 20      //300

A3A_lastActiveTime = time;
A3A_lastPlayerDir = getDir player;

while {true} do {
    sleep 10;
    private _oldDir = A3A_lastPlayerDir;
    A3A_lastPlayerDir = getDir player;

    // "speed player" return zero for sideways walking/crawling
    if (A3A_lastPlayerDir != _oldDir or vectorMagnitude velocity player > 0.1) then {
        A3A_lastActiveTime = time;
        if (player getVariable ["isAFK", false]) then { player setVariable ["isAFK", nil, [2, clientOwner]] };
        continue;
    };

    if (time - A3A_lastActiveTime > TIMEOUT_AFK and !(player getVariable ["isAFK", false])) then { 
        player setVariable ["isAFK", true, [2, clientOwner]];
    };
};
