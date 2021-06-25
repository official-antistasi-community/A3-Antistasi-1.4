/*
Maintainer: Caleb Serafin
    Starts a silent scheduled refresh if it is not already running.
    Refreshes islandIDs.
    Redraws islands.

Return Value:
    <ANY> undefined.

Scope: Client, Local Arguments, Local Effect
Environment: Unscheduled
Public: No

Dependencies:
    <SCALAR> A3A_NGSA_clickModeEnum Currently select click mode
    <SCALAR> A3A_NGSA_dotBaseSize Required for island sizing.

Example:
    call A3A_fnc_NGSA_action_autoRefresh;
*/

private _navGridHM = [localNamespace,"A3A_NGPP","navGridHM",0] call Col_fnc_nestLoc_get;
if (A3A_NGSA_refresh_busy) exitWith {};
A3A_NGSA_refresh_busy = true;
[_navGridHM] spawn {
    params ["_navGridHM"];
    isNil {_navGridHM call A3A_fnc_NGSA_navGridHM_refresh_islandID;};   // Run before any further changes occur.
    [_navGridHM,A3A_NGSA_dotBaseSize] call A3A_fnc_NG_draw_islands;

    A3A_NGSA_refresh_busy = false;
}

