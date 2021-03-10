/*
Maintainer: Caleb Serafin
    Converts a road into a save position, this handles overlapping roads at that position.

Arguments:
    <OBJECT> road, objNull if road cannot be found

Return Value:
    <POS2D|POSAGL> DB position of road.
    <STRING> Name of road | <SCALAR> 0, No name needed

Scope: Any, Global Arguments
Environment: Any
Public: No

Example:
    private _road = nearestTerrainObjects [getPos player,["MAIN ROAD","ROAD","TRACK"],1000] #0;
    private _roadPosName = _road call A3A_NG_convert_road_DBPosName;
    [_roadPosName#0, _roadPosName#1] call A3A_fnc_NG_convert_DBStruct_road;   // original road
*/
params ["_road"];

private _const_pos2DSelect = [0,2];
private _const_posOffsetMatrix = [[-3,-3],[-3,-2],[-3,-1],[-3,0],[-3,1],[-3,2],[-3,3],[-2,-3],[-2,-2],[-2,-1],[-2,0],[-2,1],[-2,2],[-2,3],[-1,-3],[-1,-2],[-1,-1],[-1,0],[-1,1],[-1,2],[-1,3],[0,-3],[0,-2],[0,-1],[0,0],[0,1],[0,2],[0,3],[1,-3],[1,-2],[1,-1],[1,0],[1,1],[1,2],[1,3],[2,-3],[2,-2],[2,-1],[2,0],[2,1],[2,2],[2,3],[3,-3],[3,-2],[3,-1],[3,0],[3,1],[3,2],[3,3]];

private _pos = getPos _road;
private _name = 0;      // Type may change to string if name is required
if (isNull roadAt _pos && !(roadAt _pos isEqualTo _road)) then {
    _pos = _pos select _const_pos2DSelect;
};
if (isNull roadAt _pos && !(roadAt _pos isEqualTo _road)) then {    // Now we go all out and try a bunch of values from an offset matrix.
    {
        private _newPos = _pos vectorAdd _x select _const_pos2DSelect;  // vectorAdd puts the z back
        if (roadAt _newPos isEqualTo _road) exitWith { _pos = _newPos };   // isEqual check in case a different road was found.
    } forEach _const_posOffsetMatrix;
};
if (isNull roadAt _pos && !(roadAt _pos isEqualTo _road)) then {
    _name = str _road;
};
[_pos,_name];
