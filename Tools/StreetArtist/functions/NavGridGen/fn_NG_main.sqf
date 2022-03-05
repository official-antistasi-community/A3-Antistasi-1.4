/*
Maintainer: Caleb Serafin
    See `Please Read Me.md` in root folder for clear instructions
    Main process that organises the creation of the navGrid.
    Calls many Street Artist Generation functions.
    Output navGridDB string includes creation time and config;
    NavGridDB is copied to clipboard.

Arguments:
    <SCALAR> Max drift is how far the simplified line segment can stray from the road in metres. (Default = 50)
    <SCALAR> Junctions are only merged if within this distance from each other. (Default = 15)
    <BOOLEAN> True to start the drawing script automatically. (Default = true)

Return Value:
    <ANY> Undefined

Scope: Client, Global Arguments
Environment: Scheduled
Public: Yes

Example:
    Default:
    [] spawn A3A_fnc_NG_main;

    Tweak parameters: IE For use on Regero's spider webs on straight roads. (until the spider-web algorith was addded).
    A3A_NGSA_generation_simplifyLoops = 10;  // Run the simplification loops multiple times to cut down on some nodes. Default is 1, you will get dimishing returns.
    [nil,20] spawn A3A_fnc_NG_main;

    Assert to hell like your life depends on it.
    A3A_NGSA_navRoad_assert = true;  // Allow the basic navRoad assetions, ussually sprinkled throught functions.
    A3A_NGSA_navRoadHM_assert = true;  // Allow the the batch assertions in main generation.
    [] spawn A3A_fnc_NG_main;

    To avoid regenerating the nev grid for drawing, you can omit A3A_fnc_NG_main after running it once. Or import from clipboard if this is a new map load.
    [] spawn A3A_fnc_NGSA_import_clipboard;
*/
if (!canSuspend) exitWith {
    private _arguments = [_this,[]] select (isNil {_this});
    _arguments spawn A3A_fnc_NG_main;
};
private _exit = isNil {
    if (isNil {A3A_NG_instanceLock}) then {
        A3A_NG_instanceLock = true;
        false;  // make isNil false.
    } else {
        nil;
    };
};
if (_exit) exitWith {
    ["Already Running", "The Navgrid Generator editor has already started.", false, 600] call A3A_fnc_customHint;
};


params [
    ["_flatMaxDrift",50,[ 0 ]],
    ["_juncMergeDistance",15,[ 0 ]],
    ["_autoEdit",true,[ true ]]
];

private _fnc_diag_report = {
    params ["_diag_step_main","_diag_step_sub"];

    [3,_diag_step_main+" | "+_diag_step_sub,"fn_NG_main"] call A3A_fnc_log;
    [_diag_step_main,_diag_step_sub,true,500] call A3A_fnc_customHint;
    400 call A3A_fnc_customHintDrop;    // No more sub steps will overwrite it
};
["Tip","Close your map and look down to make it run faster.<br/>When markers are being drawn, zooming in or closing the map gives better performance.",true,300] call A3A_fnc_customHint;

uiSleep 0.001;  // Readies the scheduler to avoid a lag spike for the following loop.

["Extraction","Extracting roads on "+worldName] call _fnc_diag_report;
private _halfWorldSize = worldSize/2;
private _worldCentre = [_halfWorldSize,_halfWorldSize];
private _worldMaxRadius = sqrt(0.5 * (worldSize^2));

// Further road verification can check if it is in _navRoadHM
private _allRoadObjects = nearestTerrainObjects [_worldCentre, A3A_NG_const_roadTypeEnum, _worldMaxRadius, false, true] select {!isNil{getRoadInfo _x #0} && {getRoadInfo _x #0 in A3A_NG_const_roadTypeEnum}};
private _navRoadHM = createHashMapFromArray (_allRoadObjects apply {[str _x,_x]});

["Extraction","Applying connections and distances"] call _fnc_diag_report;
{
    private _road = _navRoadHM get _x;
    private _connections = roadsConnectedTo [_road,true] select {str _x in _navRoadHM};
    if (isNil {_connections}) then {_connections = [];};
    {if(isNil{_x}) then {["Extraction","Road "+str _road+" at "+getPosATL _road+" was connected to nil."] call _fnc_diag_report;};} forEach _connections;
    _navRoadHM set [_x,[_road,_connections,_connections apply {_x distance _road},[]]]
} forEach +(keys _navRoadHM);


try {
    ["Fixing","One ways"] call _fnc_diag_report;
    [_navRoadHM] call A3A_fnc_NG_fix_oneWays;

    ["Fixing","Simplifying Connection Duplicates"] call _fnc_diag_report;
    [_navRoadHM] call A3A_fnc_NG_simplify_conDupe;         // Some maps have duplicates even before simplification

    ["Fixing","Dead Ends"] call _fnc_diag_report;
    [_navRoadHM] call A3A_fnc_NG_fix_deadEnds;

    ["Assertion","Checking NavRoad types."] call _fnc_diag_report;
    [_navRoadHM] call A3A_fnc_NG_navRoadHM_assert;

    for "_i" from 1 to A3A_NGSA_generation_simplifyLoops do {
        ["Simplification","Simplifying "+str count _navRoadHM+" straight roads."] call _fnc_diag_report;
        [_navRoadHM,_flatMaxDrift] call A3A_fnc_NG_simplify_flat;    // Gives less markers for junc to work on. (junc is far more expensive)
        ["Simplification","Simplification returned "+str count _navRoadHM+" straight roads."] call _fnc_diag_report;

        ["Simplification","Simplifying "+str count _navRoadHM+" junctions."] call _fnc_diag_report;
        [_navRoadHM,_juncMergeDistance] call A3A_fnc_NG_simplify_junc;
        ["Simplification","Simplification returned "+str count _navRoadHM+" road segments."] call _fnc_diag_report;

        ["Assertion","Checking NavRoad types."] call _fnc_diag_report;
        [_navRoadHM] call A3A_fnc_NG_navRoadHM_assert;
    };

    ["Format Conversion","Converting navRoadHM to navGridHM."] call _fnc_diag_report;
    private _navGridHM = [_navRoadHM] call A3A_fnc_NG_convert_navRoadHM_navGridHM;
    [localNamespace,"A3A_NGPP","navGridHM",_navGridHM] call Col_fnc_nestLoc_set;

    ["Format Conversion","Converting navGridHM to navGridDB."] call _fnc_diag_report;
    private _navGridDB = [_navGridHM] call A3A_fnc_NG_convert_navGridHM_navGridDB;

    private _navGridDB_formatted = ("/*{""systemTimeUCT_G"":"""+(systemTimeUTC call A3A_fnc_systemTime_format_G)+""",""worldName"":"""+worldName+""",""StreetArtist_Config"":{""_flatMaxDrift"":"+str _flatMaxDrift+",""_juncMergeDistance"":"+str _juncMergeDistance+"}}*/
") + ([_navGridDB] call A3A_fnc_NG_format_navGridDB);

    [localNamespace,"A3A_NGPP","navGridDB_formatted",_navGridDB_formatted] call Col_fnc_nestLoc_set;

    ["Done","navGridDB copied to clipboard!<br/><br/>If you have lost your clipboard, you can grab the navGridDB_formatted with<br/>`copyToClipboard ([localNamespace,'A3A_NGPP','navGridDB_formatted',''] call Col_fnc_nestLoc_get)`"] call _fnc_diag_report;
    copyToClipboard _navGridDB_formatted;
/*
    ["Unit Test","Converting navGridDB to navGridHM."] call _fnc_diag_report;
    _navGridHM = [_navGridDB] call A3A_fnc_NG_convert_navGridDB_navGridHM;
    [localNamespace,"A3A_NGPP","navGridHM",_navGridHM] call Col_fnc_nestLoc_set;
//*/

    ["Done","Generation Complete."] call _fnc_diag_report;
    if (_autoEdit) then {
        [] call A3A_fnc_NGSA_main;
    };
} catch {
    ["Generation Error",str _exception,false,600] call A3A_fnc_customHint;
};
