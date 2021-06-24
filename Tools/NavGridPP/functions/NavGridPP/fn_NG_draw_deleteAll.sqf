/*
Maintainer: Caleb Serafin
    Deletes all existing map markers

Return Value:
    <ANY> Undefined

Scope: Client, Global Arguments
Environment: Scheduled
Public: Yes

Example:
    [] spawn A3A_fnc_NG_draw_deleteAll;
*/
if (!canSuspend) exitWith {
    throw ["NotScheduledEnvironment","Please execute NG_main in a scheduled environment as it is a long process: `[] spawn A3A_fnc_NG_draw_deleteAll;`."];
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

_diag_step_main = "Deleting Dots";
call _fnc_diag_render;
private _markers = [localNamespace,"A3A_NGPP","draw","dotOnRoads",[]] call Col_fnc_nestLoc_get;
{
    deleteMarker _x;
} forEach _markers;
_markers resize 0;  // Preserves reference

_diag_step_main = "Deleting Lines";
call _fnc_diag_render;
private _markers = [localNamespace,"NavGridPP","draw","LinesBetweenRoads",[]] call Col_fnc_nestLoc_get;
{
    deleteMarker _x;
} forEach _markers;
_markers resize 0;  // Preserves reference


_diag_step_main = "Done!";
call _fnc_diag_render;