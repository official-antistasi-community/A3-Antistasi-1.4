/*
Maintainer: Caleb Serafin
    Use `[] spawn A3A_fnc_NG_import;` for importing from clipboard.
    Loads navIslands from localNamespace >> "A3A_NGPP" >> "navIslands"
    ()Re)draws new markers according to user settings.

Arguments:
    <SCALAR> Thickness of line, 1-high density, 4-normal, 8-Stratis world view, 16-Seattle world view. (Set to 0 to disable) (Default = 4)
    <BOOLEAN> False if line partially transparent, true if solid and opaque. (Default = false)
    <BOOLEAN> True to draw distance between road segments. (Only draws if above 5m) (Default = false)
    <SCALAR> Size of road node dots. (Set to 0 to disable) (Default = 0.8)
    <SCALAR> Size of island dots. (Set to 0 to disable) (Default = 1)

Return Value:
    <ANY> Undefined

Scope: Client, Global Arguments
Environment: Scheduled
Public: Yes

Example:
    [] spawn A3A_fnc_NG_main_draw;

    Or tweak parameters:
    [4,false,false,0.8,1.5] spawn A3A_fnc_NG_main_draw;

    NB: if importing from clipboard, remember to run this first!
    [] spawn A3A_fnc_NG_import;
*/
params [
    ["_line_size",4,[ 0 ]],
    ["_line_opaque",false,[ false ]],
    ["_drawDistance",false,[ false ]],
    ["_dot_size",0.8,[ 0 ]],
    ["_islandDot_size",1,[ 0 ]]
];

if (!canSuspend) exitWith {
    throw ["NotScheduledEnvironment","Please execute NG_main in a scheduled environment as it is a long process: `[] spawn A3A_fnc_NG_main_draw;`."];
};

private _diag_step_main = "";
private _fnc_diag_render = { // call _fnc_diag_render;
    [
        "Nav Grid++ Draw",
        "<t align='left'>" +
        _diag_step_main+"<br/>"+
        "</t>",
        true
    ] remoteExec ["A3A_fnc_customHint",0];
};

if ([localNamespace,"A3A_NGPP","activeProcesses","NG_main_draw",false] call Col_fnc_nestLoc_get) then {
    _diag_step_main = "NG_main_draw is already running!<br/>It may be busy or waiting for the navIslands to be generated.";
    call _fnc_diag_render;
};
[localNamespace,"A3A_NGPP","activeProcesses","NG_main_draw",true] call Col_fnc_nestLoc_set;

if ([localNamespace,"A3A_NGPP","activeProcesses","NG_main",false] call Col_fnc_nestLoc_get) then {
    _diag_step_main = "Waiting for navIslands to be generated...<br/><br/>The navGrid++ hint be be behind this, dismiss this hint to see it's progress.";
    call _fnc_diag_render;
    waitUntil {
        uiSleep 2;
        !([localNamespace,"A3A_NGPP","activeProcesses","NG_main",false] call Col_fnc_nestLoc_get);
    }
};

_navIslands = [localNamespace,"A3A_NGPP","navIslands",[]] call Col_fnc_nestLoc_get;
if (_navIslands isEqualTo []) exitWith {
    _diag_step_main = "navIslands not generated...<br/>If you have not, please run `[] spawn A3A_fnc_NG_main`.";
    call _fnc_diag_render;
};

call A3A_fnc_NG_draw_deleteAll;

_diag_step_main = "Drawing LinesBetweenRoads";
call _fnc_diag_render;
[4,"A3A_fnc_NG_draw_linesBetweenRoads","fn_NG_main_draw"] call A3A_fnc_log;
[_navIslands,_line_size,_line_opaque,_drawDistance] call A3A_fnc_NG_draw_linesBetweenRoads;

_diag_step_main = "Drawing DotsOnRoads";
call _fnc_diag_render;
[4,"A3A_fnc_NG_draw_dotOnRoads","fn_NG_main_draw"] call A3A_fnc_log;
[_navIslands,_dot_size,_islandDot_size] call A3A_fnc_NG_draw_dotOnRoads;

_diag_step_main = "Done<br/>You can re-run `A3A_fnc_NG_main_draw` as many times as you want to redraw the markers without re-generating the navGrid.";
call _fnc_diag_render;
[localNamespace,"A3A_NGPP","activeProcesses","NG_main_draw",false] call Col_fnc_nestLoc_set;
uiSleep 1;
call _fnc_diag_render;
