/*
Maintainer: Caleb Serafin
    First code run upon machine joining/starting the mission.
    This is run before Join-In-Progress.
    Mission objects have not initialised.
    Player object is not available.
    https://community.bistudio.com/wiki/Initialization_Order

    This file is best suited for calling initialisers for variables and lookup tables.
    This file ensures that a dependency order can be maintained.
    Do not vomit your initialiser code in here, place it in the relevant folder for your module and call it.
    Code is allowed to take a while to execute (multiple milliseconds).
    Because if it started later in scheduled init code, the player would still need to wait, and for much longer.

Scope: All
Environment: Unscheduled
Public: Yes
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Debug("fn_initPreJIP Started");

call A3A_fnc_uintToHexGenTables;
call A3A_fnc_shortID_init;


Debug("fn_initPreJIP Finished");
