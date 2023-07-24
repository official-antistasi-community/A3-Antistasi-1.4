/*  Routine to handle distribution of petros post-death placement "UI" to clients

Environment: Server, spawned

Arguments: None

*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Info("Petros death monitor started");

A3A_playerPlacingPetros = "";           // this is a playerID

while {!alive petros} do {
    private _userInfo = getUserInfo A3A_playerPlacingPetros;
    if (_userInfo isEqualTo [] or {_userInfo # 6 != 10}) then {          // client state number
        // Don't bother trying to open the interface until we have an alive & conscious commander
        if (!alive theBoss or {theBoss getVariable ["incapacitated", false]}) exitWith {};

        // In case commander is remote controlling...
        private _index = allPlayers findIf { _x getVariable ["owner", _x] == theBoss };
        if (_index == -1) exitWith { Error("Uh, boss has no owner?") };
        private _bossPlayer = allPlayers select _index;

        Info_1("Selected player %1 to place petros", name _bossPlayer);

        A3A_playerPlacingPetros = getPlayerID _bossPlayer;
        publicVariable "A3A_playerPlacingPetros";
        [] remoteExec ["A3A_fnc_placementSelection", _bossPlayer];
    };
    sleep 5;
};

Info("Petros successfully placed");
