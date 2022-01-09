/*
Maintainer: Caleb Serafin
    Removes a navRoad from the navRoadHM.

Arguments:
    <NavRoadHM> Parent hashmap, Used for assertions, optional. (Default = nil)
    <NavRoad> NavRoad
    <STRING> Calling function's name (Default = nil)

Environment: Any
Public: No

Example:
    [_navRoadHM, _navRoad, "fn_myFunction"] call A3A_fnc_NG_navRoadHM_remove;
*/

params [
    ["_navRoadHM", nil, [createHashMap]],
    "_navRoad",
    ["_callingFunctionTitle", "NavRoad Disconnect", [""]]
];

private _fnc_reportHaltingError = {
    params [["_details","!Sub Error, error details failed to created.", [ "" ]]];
    [1,"From " + _callingFunctionTitle + " | " + _details,"fn_NG_navRoadHM_remove"] call A3A_fnc_log;
    [_callingFunctionTitle,"Please check RPT.<br/>" + _details,true,600] call A3A_fnc_customHint;
};
private _fnc_reportMinorIssue = {
    params [["_details","!Sub Error, error details failed to created.", [ "" ]]];
    [3,"From " + _callingFunctionTitle + " | " + _details,"fn_NG_navRoadHM_remove"] call A3A_fnc_log;
};


if (isNil {_navRoadHM}) exitWith {
    ("_navRoadHM was nil") call _fnc_reportHaltingError;
};
[_navRoad, _navRoadHM, _callingFunctionTitle + ".fn_NG_navRoadHM_remove"] call A3A_fnc_NG_navRoad_assert;


private _peerNavRoads = [_navRoad,_navRoadHM] call A3A_fnc_NG_navRoad_getPeers;
{
    [_navRoad, _x, _callingFunctionTitle + ".fn_NG_navRoadHM_remove", _navRoadHM] call A3A_fnc_NG_navRoad_disconnect;
} forEach _peerNavRoads;

private _road = _navRoad#0;

if ([_navRoad, _navRoadHM, _callingFunctionTitle + ".fn_NG_navRoadHM_remove"] call A3A_fnc_NG_navRoad_assert) then {
    _navRoadHM deleteAt (str _road);
    //diag_log ("Deleted: " + str _road);
    if (str _road in _navRoadHM) then {
        diag_log "Why not deleted??";
    };
} else {
    throw "NOT DELETEDEDEDED!"
};


{
    [_x, _navRoadHM, _callingFunctionTitle + ".fn_NG_navRoadHM_remove"] call A3A_fnc_NG_navRoad_assert;
} forEach _peerNavRoads;
