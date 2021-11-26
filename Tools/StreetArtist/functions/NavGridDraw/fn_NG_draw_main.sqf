/*
Maintainer: Caleb Serafin
    Use `[] spawn A3A_fnc_NGSA_import;` for importing from clipboard.
    Loads navGridHM from localNamespace >> "A3A_NGPP" >> "navGridHM"
    (Re)draws new markers according to user settings.

Arguments:
    <SCALAR> Thickness of line, 1-high density, 4-normal, 8-Stratis world view, 16-Seattle world view. (Set to 0 to disable) (Default = 4)
    <BOOLEAN> False if line partially transparent, true if solid and opaque. (Default = false)
    <BOOLEAN> True to draw distance between road segments. (Only draws if above 5m) (Default = false)
    <SCALAR> Size of road node dots. (Set to 0 to disable) (Default = 0.8)
    <SCALAR> Size of island dots. (Set to 0 to disable) (Default = 0.8)
    <BOOLEAN> Silent, don't produce hint messages.

Return Value:
    <ANY> Undefined

Scope: Client, Global Arguments
Environment: Scheduled
Public: Yes

Example:
    [] spawn A3A_fnc_NG_draw_main;

    Or tweak parameters:
    [4,false,false,0.8,1.5] spawn A3A_fnc_NG_draw_main;

    NB: if importing from clipboard, remember to run this first!
    [] spawn A3A_fnc_NGSA_import;
*/
params [
    ["_line_size",A3A_NGSA_lineBaseSize,[ 0 ]],
    ["_line_opaque",false,[ false ]],
    ["_drawDistance",false,[ false ]],
    ["_dot_size",A3A_NGSA_dotBaseSize,[ 0 ]],
    ["_islandDot_size",A3A_NGSA_dotBaseSize,[ 0 ]],
    ["_silent",false,[false]]
];

if (!canSuspend) exitWith {
    throw ["NotScheduledEnvironment","Please execute NG_main in a scheduled environment as it is a long process: `[] spawn A3A_fnc_NG_draw_main;`."];
};

if (isNil {
    [0,nil] select ([localNamespace,"A3A_NGPP","draw","busy", false] call Col_fnc_nestLoc_get);
}) exitWith {};
[localNamespace,"A3A_NGPP","draw","busy", true] call Col_fnc_nestLoc_set;

private _fnc_diag_report = if (_silent) then {{}} else {
    {
        params ["_diag_step_main"];

        [3,_diag_step_main,"fn_NG_main"] call A3A_fnc_log;
        ["Drawing",_diag_step_main,true,200] call A3A_fnc_customHint;
    };
};

_navGridHM = [localNamespace,"A3A_NGPP","navGridHM",[]] call Col_fnc_nestLoc_get;
if (_navGridHM isEqualTo []) exitWith {
    "navGridHM not generated...<br/>If you have not, please run `[] spawn A3A_fnc_NG_main` or [] spawn A3A_fnc_NGSA_import." call _fnc_diag_report;
    [localNamespace,"A3A_NGPP","draw","busy", false] call Col_fnc_nestLoc_set;
};

"Drawing Lines Between Roads" call _fnc_diag_report;
[_navGridHM,_line_size,_line_opaque,_drawDistance] call A3A_fnc_NG_draw_linesBetweenRoads;

"Drawing Dots On Roads" call _fnc_diag_report;
[_navGridHM,_dot_size] call A3A_fnc_NG_draw_dotOnRoads;

"Refreshing Island Makers" call _fnc_diag_report;
[_navGridHM] call A3A_fnc_NGSA_navGridHM_refresh_islandID;

"Drawing Island Makers" call _fnc_diag_report;
[_navGridHM,_islandDot_size] call A3A_fnc_NG_draw_islands;

"Done<br/>You can re-run `A3A_fnc_NG_draw_main` as many times as you want to redraw the markers without re-generating the navGrid." call _fnc_diag_report;

[localNamespace,"A3A_NGPP","draw","busy", false] call Col_fnc_nestLoc_set;
