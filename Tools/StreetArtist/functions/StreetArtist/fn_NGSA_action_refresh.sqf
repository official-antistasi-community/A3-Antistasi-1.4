/*
Maintainer: Caleb Serafin
    Refreshes islandIDs.
    Redraws all markers.

Arguments:
    <BOOLEAN> true to make silent. [Default = false]
    <BOOLEAN> forceRun. Reserved to internal scheduling. Do not set true! [Default = false]

Return Value:
    <ANY> undefined.

Scope: Client, Local Arguments, Local Effect
Environment: Scheduled.
Public: No

Example:
    call A3A_fnc_NGSA_action_refresh;
*/
params [
    ["_silent",false],
    ["_forceRun",false]
];

if (!canSuspend) exitWith {
    throw ["NotScheduledEnvironment","Please execute NG_main in a scheduled environment as it is a long process: `[] spawn A3A_fnc_NGSA_action_refresh;`."];
};

private _fnc_diag_report = {};
if (!_silent) then {
    _fnc_diag_report = {
        params ["_diag_step_main"];
        ["Refresh",_diag_step_main,true,200] call A3A_fnc_customHint;
    };
};

if (A3A_NGSA_refresh_busy && !_forceRun) exitWith {
    A3A_NGSA_refresh_scheduled = true;
    A3A_NGSA_refresh_scheduledSilent = A3A_NGSA_refresh_scheduled && _silent;
    if (!_silent) then {
        ["Refresh","Auto refresh is busy running. Scheduled another refresh.",false,201] call A3A_fnc_customHint;
    };
};
A3A_NGSA_refresh_busy = true;
"Refreshing All Markers." call _fnc_diag_report;
[nil,false,false] call A3A_fnc_NG_draw_main;

if (A3A_NGSA_refresh_scheduled) then {
    A3A_NGSA_refresh_scheduled = false;
    private _silent = A3A_NGSA_refresh_scheduledSilent;
    A3A_NGSA_refresh_scheduledSilent = true;
    [201] call A3A_fnc_customHintDrop;
    [_silent,true] call A3A_fnc_NGSA_action_refresh;
} else {
    A3A_NGSA_refresh_busy = false;
    "Islands refreshed!" call _fnc_diag_report;
};

