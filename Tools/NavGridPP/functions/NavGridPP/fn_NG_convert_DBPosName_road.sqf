/*
Maintainer: Caleb Serafin
    Converts a save position into a road, this handles overlapping roads at that position.

Arguments:
    <POS2D|POSAGL> DB position of road.
    <STRING> Name of road | <SCALAR> No name provided

Return Value:
    <OBJECT> road, objNull if road cannot be found

Scope: Any, Global Arguments
Environment: Any
Public: No

Example:
    private _road = nearestTerrainObjects [getPos player,["MAIN ROAD","ROAD","TRACK"],1000] #0;
    private _roadPosName = _road call A3A_NG_convert_road_DBPosName;
    [_roadPosName#0, _roadPosName#1] call A3A_fnc_NG_convert_DBPosName_road;   // original road
*/
params ["_pos","_name"];

private _road = roadAt _pos;
if !(isNull _road) exitWith {
    _road;
};

private _roadObjects = nearestTerrainObjects [_pos, ["ROAD", "MAIN ROAD", "TRACK"], 30, false, true];
private _index = _roadObjects findIf {str _x isEqualTo _name};
if (_index != -1) exitWith {
    _roadObjects#_index;
};

[1,"Could not round-trip position of road "+_name+" at " + str _pos + ".","fn_NG_convert_DBPosName_road"] call A3A_fnc_log;
objNull;
