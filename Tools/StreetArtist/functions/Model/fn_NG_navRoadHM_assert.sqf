/*
Maintainer: Caleb Serafin
    Performs batch NavRoad insertions on the provided array.
    Major errors are logged and visible.
    Each assertion makes it's own logs and displays.

Argument: <NavRoadHM> navRoad hashMap.
Return Value: <BOOL> True if there were no failed assertions.

Environment: Scheduled
Public: Yes

Example:
    [_navRoadHM] call A3A_fnc_NG_navRoadHM_assert;
*/
if (isNil{A3A_NGSA_navRoadHM_assert}) exitWith {true};

params [
    ["_navRoadHM", nil, [ createHashMap ]]
];

private _fnc_reportFailedAssertion = {
    params [["_details","!Sub Error, error details failed to created.", [ "" ]]];
    private _errorTitle = "NavRoadHM Assertion Failed";
    [1, _details,"fn_NG_navRoadHM_assert"] call A3A_fnc_log;
    [_errorTitle,"Please check RPT.<br/>" + _details,true,600] call A3A_fnc_customHint;
    false;
};
if (isNil {_navRoadHM}) exitWith {
    ("_navRoadHM was nil.") call _fnc_reportFailedAssertion;
    false;
};


private _fnc_diag_render = { // [] call _fnc_diag_render;
    params [["_diag_step_sub",""]];
    ["NavRoadHM Assertion",_diag_step_sub,true,400] call A3A_fnc_customHint;
};
private _fnc_diag_renderLog = { // [] call _fnc_diag_renderLog;
    params [["_diag_step_sub",""]];
    private _title = "NavRoadHM Assertion";
    [_title,_diag_step_sub,true,400] call A3A_fnc_customHint;
    [2,_diag_step_sub,"fn_NG_navRoadHM_assert"] call A3A_fnc_log;
};


("NavRoadHM assertion starting") call _fnc_diag_renderLog;
private _diag_totalJobs = count _navRoadHM;
private _diag_currentJob = 0;
private _failiures = 0;
{
    _diag_currentJob = _diag_currentJob + 1;
    if (_diag_currentJob mod 100 == 0) then {
        ("Completion &lt;" + ((100*_diag_currentJob /_diag_totalJobs) toFixed 1) + "% &gt; Job &lt;" + (str _diag_currentJob) + " / " + (str _diag_totalJobs) + "&gt;") call _fnc_diag_render;
    };
    if !([_y, _navRoadHM, "fn_NG_navRoadHM_assert"] call A3A_fnc_NG_navRoad_assert) then {
        _failiures = _failiures + 1;
        if (_failiures >= 1000) then {
            ("Stopping early due to too many failed assertions (1000).") call _fnc_reportFailedAssertion;
            break;
        };
    };
} forEach _navRoadHM;
("NavRoadHM assertion finished, "+(_failiures toFixed 0) +" failed assertions") call _fnc_diag_renderLog;

(_failiures == 0);
