/*
Maintainer: Caleb Serafin
    Starts the StreetArtist Editor.
    Asks to imports data by default, but can also start empty.

Arguments:
    <BOOLEAN> Set to true to skip import and start with no nodes. (Default = false)

Scope: Clients, Global Arguments, Local Effect
Environment: Scheduled
Public: Yes

Example:
    [] spawn A3A_fnc_NGSA_main;

    // Start empty
    [true] spawn A3A_fnc_NGSA_main;
*/
if (!canSuspend) exitWith {
    private _arguments = [_this,[]] select (isNil {_this});
    _arguments spawn A3A_fnc_NGSA_main;
};
private _exit = isNil {
    if (isNil {A3A_NGSA_instanceLock}) then {
        A3A_NGSA_instanceLock = true;
        false;  // make isNil false.
    } else {
        nil;
    };
};
if (_exit) exitWith {
    ["Already Running", "The StreetArtist editor has already started.", false, 200] call A3A_fnc_customHint;
};

params [
    ["_startEmpty", false, [false]]
];


private _navGridHM = createHashMap;

if !(_startEmpty) then {
    private _generated_navGridHM = [localNamespace,"A3A_NGPP","navGridHM",0] call Col_fnc_nestLoc_get;

    if (_generated_navGridHM isEqualType 0) then {
        private _navGridDBAndHM = [] call A3A_fnc_NGSA_import;
        if (count _navGridDBAndHM < 2) exitWith {
            _exit = true;
            [
                "Import Failed",
                "Please check that you have copied the whole navGrid file contents.<br/>"+
                "if that does not work:<br/>"+
                "Please only copy the array from the navGridDB file. Paste your clipboard into a file and REMOVE other code from it.<br/>"+
                "(If you intended to start with an empty grid, use `[true] spawn A3A_fnc_NGSA_main`)<br/>",
                false,  // Make ping noise
                200
            ] call A3A_fnc_customHint;
        };
        _navGridHM = _navGridDBAndHM#1;
    } else {
        _navGridHM = _generated_navGridHM;
    };
};
if (_exit) exitWith {
    A3A_NGSA_instanceLock = nil;
    [] spawn A3A_fnc_NGSA_mainDialog;
};


[localNamespace,"A3A_NGPP","navGridHM",_navGridHM] call Col_fnc_nestLoc_set;
private _navGridPosRegionHM = [_navGridHM] call A3A_fnc_NGSA_posRegionHM_generate;
[localNamespace,"A3A_NGPP","navGridPosRegionHM",_navGridPosRegionHM] call Col_fnc_nestLoc_set;

[nil,false,false] call A3A_fnc_NG_draw_main;
[_navGridHM,_navGridPosRegionHM] call A3A_fnc_NGSA_EH_add;
call A3A_fnc_NGSA_refreshMarkerOrder;


openMap true;
