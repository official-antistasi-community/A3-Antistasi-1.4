/*
Author: Wurzel0701
    Draws a line from one point to another in a given color for a given time

Arguments:
    <POSITION> The start position of the line
    <POSITION> The end position of the line
    <STRING> The color the line should have
    <NUMBER> The amount of time in seconds the line should stay visible (-1 means forever) (DEFAULT: 60)

Return Value:
    <NULL>

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <NULL>

Example:
    [_startPos, _endPos, "ColorGreen", 100] call A3A_fnc_drawLine;
*/

params
[
    ["_startPos", [], [[]]],
    ["_endPos", [], [[]]],
    ["_color", "ColorBlack", [""]],
    ["_time", 60, [0]]
];

private _distance = _startPos distance2D _endPos;
private _angle = _startPos getDir _endPos;
private _mid = (_startPos vectorAdd _endPos) vectorMultiply 0.5;

private _lineMarker = createMarker [format ["%1line%2", str _startPos, str _endPos], _mid];
_lineMarker setMarkerShape "RECTANGLE";
_lineMarker setMarkerBrush "SOLID";
_lineMarker setMarkerColor _color;
_lineMarker setMarkerDir _angle;
_lineMarker setMarkerSize [3, _distance/2];

if(_time >= 0) then
{
    [_lineMarker, _time] spawn
    {
        sleep (_this select 1);
        deleteMarker (_this select 0);
    };
};
