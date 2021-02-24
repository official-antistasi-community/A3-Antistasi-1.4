/*
Maintainer: Caleb Serafin
    Create a dialogue to paste navGridDB from the clipboard.
    Saves it to nestLocs for further usage by other modules.

Return Value:
    <BOOLEAN> True if success, false if error.

Scope: Any, Global Arguments
Environment: Scheduled
Public: Yes

Example:
    [] spawn A3A_fnc_NG_import;
*/

if (!canSuspend) exitWith {
    throw ["NotScheduledEnvironment","Please execute NG_main in a scheduled environment as it is a long process: `[] spawn A3A_fnc_NG_main_draw;`."];
};

private _diag_step_main = "";
private _fnc_diag_render = { // call _fnc_diag_render;
    [
        "Nav Grid++ Import",
        "<t align='left'>" +
        _diag_step_main+"<br/>"+
        "</t>",
        true
    ] remoteExec ["A3A_fnc_customHint",0];
    [4,_diag_step_main,"fn_NG_import"] call A3A_fnc_log;
};


//private _navGridDB_formatted = copyFromClipboard; // Disabled in multiplayer :'(
if !(createDialog "A3A_NG_import_dialogue") exitWith {
    throw ["CreateDialogFailed","Failed to create A3A_NG_import_dialogue."];
};

waitUntil {
    uiSleep 1;
    !dialog;
};

if (isNil {A3A_NG_import_NGDB_formatted}) exitWith {
    _diag_step_main = "Import cancelled by closing dialogue without pressing Import.";
    call _fnc_diag_render;
};
private _navGridDB_formatted = A3A_NG_import_NGDB_formatted;

_diag_step_main = "Checking contents...";
call _fnc_diag_render;
if ("navGrid" in _navGridDB_formatted) then {   // Try to remove assignment code
    private _startIndex = (_navGridDB_formatted find "=") + 1;
    _navGridDB_formatted = _navGridDB_formatted select [_startIndex,count _navGridDB_formatted - _startIndex];

    private _endCount = (_navGridDB_formatted find ";");
    _navGridDB_formatted = _navGridDB_formatted select [0,_endCount];
};

_diag_step_main = "Parsing...<br/><br/>If this fails and throws an error:<br/><br/>Please only copy the array from the navGridDB file. Paste your clipboard into a file and REMOVE other code from it.";
call _fnc_diag_render;
private _navGridDB = parseSimpleArray _navGridDB_formatted;
if (isNil {_navGridDB} || _navGridDB isEqualTo []) exitWith {
    _diag_step_main = "Failed to parseSimpleArray.<br/><br/>Please only copy the array from the navGridDB file. Paste your clipboard into a file and REMOVE other code from it.";
    call _fnc_diag_render;
};

_diag_step_main = "Converting navGridDB to navIslands...";
call _fnc_diag_render;

[4,"A3A_fnc_NG_convert_navGridDB_navIslands","fn_NG_main"] call A3A_fnc_log;
private _navIslands = [_navGridDB] call A3A_fnc_NG_convert_navGridDB_navIslands;

if (isNil {_navIslands} || _navIslands isEqualTo []) exitWith {
    _diag_step_main = "Failed to convert navGridDB to navIslands.<br/><br/>Please check that all entries are nested in one big array and that the opening square bracket `[` wasn't deleted accidentally.";
    call _fnc_diag_render;
};
[localNamespace,"A3A_NGPP","navIslands",_navIslands] call Col_fnc_nestLoc_set;


_diag_step_main = "Done! Import successful<br/><br/>Data is stored in nestLoc: localNamespace &gt;&gt; ""A3A_NGPP"" &gt;&gt; ""navIslands"" <br/><br/>Drawing code will use this data.";
call _fnc_diag_render;