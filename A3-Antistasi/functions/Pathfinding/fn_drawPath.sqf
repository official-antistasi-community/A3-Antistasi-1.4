/*
Author: Wurzel0701
    Draws a given path

Arguments:
    <ARRAY> The path which should be drawn
    <NUMBER> The amount of time the marker should stay visible (-1 means forever)

Return Value:
    <NULL>

Scope: Any
Environment: Any
Public: Yes
Dependencies:
    <NULL>

Example:
    [_path] call A3A_fnc_drawPath;
*/

params
[
    ["_path", [], [[]]],
    ["_time", 60, [0]]
];

private _pathLength = count _path;
private _pathID = round (random 1000);

{
    private _nodeData = _x;
    private _nodePos = _x;
    private _nodeColor = "ColorGreen";
    if(count _nodeData == 2) then
    {
        _nodePos = _nodeData select 0;
        if !(_nodeData select 1) then
        {
            _nodeColor = "ColorBlack";
        };
    };

    private _marker = createMarker [format ["%1Path%2", _pathID, _forEachIndex], _nodePos];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "mil_dot";
    _marker setMarkerColor _nodeColor;
    _marker setMarkerAlpha 1;
    _marker setMarkerText (str _forEachIndex);

    if(_time >= 0) then
    {
        [_time, _marker] spawn
        {
            sleep (_this select 0);
            deleteMarker (_this select 1);
        };
    };

    if(_forEachIndex < (_pathLength - 1)) then
    {
        private _nextPos = _path select (_forEachIndex + 1);
        if(count _nextPos == 2) then
        {
            _nextPos = _nextPos select 0;
        };
        [_nodePos, _nextPos, "ColorRed", _time] call A3A_fnc_drawLine;
    };
} forEach _path;
