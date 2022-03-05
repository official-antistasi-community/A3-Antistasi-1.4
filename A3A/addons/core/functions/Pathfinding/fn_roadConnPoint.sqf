/*
    A3A_fnc_roadConnPoint
    Find connecting point between two roads, either closest end or intercept

Parameters:
    <OBJECT> Start road
    <OBJECT> End road

Returns:
    <PosASL> Position of connecting point
*/

// Note that the inputs and output are typically 3D but the intercept calc is performed in 2D.
private _fnc_vecIntercept = {
    params ["_r1s", "_r1e", "_r2s", "_r2e"];
    private ["_sdiff", "_dir1", "_dir2", "_div", "_t"];
    _dir1 = _r1e vectorDiff _r1s;
    _dir2 = _r2e vectorDiff _r2s;
    _sdiff = _r1s vectorDiff _r2s;
    _div = (_dir1#1)*(_dir2#0) - (_dir1#0)*(_dir2#1);
    if (_div < 1e-10) exitWith {_r1e};			// low angle case, just return the endpoint
    _t = ((_sdiff#0)*(_dir2#1) - (_sdiff#1)*(_dir2#0)) / _div;
    _r1s vectorAdd (_dir1 vectorMultiply _t);
};

params ["_road1", "_road2"];
private _r1info = getRoadInfo _road1;
private _r2info = getRoadInfo _road2;

// order road1 ends as [start, end] by proximity to road2
private _r1ends = if (_r1info#6 distance2d _road2 < _r1info#7 distance2d _road2) then
    { [_r1info#7, _r1info#6] } else { [_r1info#6, _r1info#7] };

private _r1conn = count roadsConnectedTo [_road1, true];
private _r2conn = count roadsConnectedTo [_road2, true];
if (_r1conn <= 2 && _r2conn <= 2) exitWith { _r1ends # 1 };     // if roads aren't junctions, just use the closest end
[_r1ends#0, _r1ends#1, _r2info#6, _r2info#7] call _fnc_vecIntercept;
