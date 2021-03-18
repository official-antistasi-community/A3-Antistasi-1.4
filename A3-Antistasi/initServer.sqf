/*
 * The reason for this split, is we can't open dialog boxes during initServer in singleplayer.
 * This is an issue if we want to get params data before initialising the server.

 * So if it's singleplayer, we wait for initServer.sqf to finish (and the player to be spawned in), then get params, then load.
 */

if (isMultiplayer) then {
    [] call A3A_fnc_initServer;
} else {
    [] spawn {
        #include "Includes\common.inc"
FIX_LINE_NUMBERS()
        waitUntil {!isNull player && player == player && !isNull (finddisplay 46)};
        Info("Opening Singleplayer Parameter Dialog");
        [] call A3A_fnc_createDialog_setParams;
        Info("Proceeding to initServer");
        [] call A3A_fnc_initServer;
    };
};
