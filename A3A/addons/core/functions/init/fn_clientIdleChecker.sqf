
#define TIMEOUT_AFK 20      //300

A3A_lastActiveTime = time;
A3A_lastPlayerDir = getDir player;

while {true} do {
    sleep 10;
    private _oldDir = A3A_lastPlayerDir;
    A3A_lastPlayerDir = getDir player;

	if (A3A_lastPlayerDir != _oldDir) then {
        A3A_lastActiveTime = time;
        if (player getVariable ["isAFK", false]) then { player setVariable ["isAFK", nil, [2, clientOwner]] };
        continue;
    };

    if (time - A3A_lastActiveTime > TIMEOUT_AFK and !(player getVariable ["isAFK", false])) then { 
        player setVariable ["isAFK", true, [2, clientOwner]];
    };
};
