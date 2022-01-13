/*
Maintainer: Caleb Serafin
    Create a dialogue to paste navGridDB from the clipboard.
    Also converts navGridDB to navGridHM.
    Saves both to nestLocs for further usage by other modules.

Return Value:
    <ARRAY<navGridDB,navGridHM>>

Scope: Any, Global Arguments
Environment: Scheduled
Public: Yes

Example:
    [] spawn A3A_fnc_NGSA_import;
*/

if (!canSuspend) exitWith {
    throw ["NotScheduledEnvironment","Please execute NG_main in a scheduled environment as it is a long process: `[] spawn A3A_fnc_NG_draw_main;`."];
    [];
};

private _diag_step_main = "";
private _fnc_diag_render = { // call _fnc_diag_render;
    ["Import",_diag_step_main,true,200] call A3A_fnc_customHint;
    [4,_diag_step_main,"fn_NG_import"] call A3A_fnc_log;
};


//private _navGridDB_formatted = copyFromClipboard; // Disabled in multiplayer :'(
if !(createDialog "A3A_NG_import_dialogue") exitWith {
    ["CreateDialogFailed","Failed to create A3A_NG_import_dialogue.",false,500] call A3A_fnc_customHint;
    [];
};

waitUntil {
    uiSleep 1;
    !dialog;
};

if (isNil {A3A_NG_import_NGDB_formatted} || {!(A3A_NG_import_NGDB_formatted isEqualType "")}) exitWith {
    _diag_step_main = "Import cancelled by closing dialogue.";
    call _fnc_diag_render;
    [];
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
    [];
};

_diag_step_main = "Converting navGridDB to navGridHM...";
call _fnc_diag_render;

[4,"A3A_fnc_NG_convert_navGridDB_navGridHM","fn_NG_main"] call A3A_fnc_log;
private _navGridHM = [_navGridDB] call A3A_fnc_NG_convert_navGridDB_navGridHM;

if (isNil {_navGridHM} || count _navGridHM != count _navGridDB) exitWith {
    _diag_step_main = "Failed to convert navGridDB to navGridHM.<br/><br/>Please check that all entries are nested in one big array and that the opening square bracket `[` wasn't deleted accidentally.";
    call _fnc_diag_render;
    [];
};
[_navGridHM] call A3A_fnc_NGSA_correctPositions;
_diag_step_main = "Correcting Positions...";
call _fnc_diag_render;
[localNamespace,"A3A_NGPP","navGridDB",_navGridDB] call Col_fnc_nestLoc_set;
[localNamespace,"A3A_NGPP","navGridHM",_navGridHM] call Col_fnc_nestLoc_set;


_diag_step_main = "Done! Import successful<br/><br/>Data is stored in nestLoc: localNamespace &gt;&gt; ""A3A_NGPP"" &gt;&gt; ""navGridHM"" <br/><br/>Drawing code will use this data.";
call _fnc_diag_render;

[_navGridDB,_navGridHM];
