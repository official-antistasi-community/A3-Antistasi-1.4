/*
Maintainer: Caleb Serafin
    Draws a line between the roads

Arguments:
    <STRING> Marker name.
    <BOOL> If marker already exists.
    <POS2D> Start pos
    <POS2D> End Pos
    <STRING> Marker Colour eg "ColorOrange"
    <SCALAR> Thickness of line, 1-high density, 2-normal, 8-Stratis world view, 16-Seattle world view. (Set to 0 to disable) (Default = 2)
    <STRING> Line brush, eg: "Solid"

Return Value:
    <ANY> Undefined

Scope:Any, Local Arguments, Global Effect
Environment: Scheduled
Public: Yes

Example:
    [_name,_exists,_myPos,_otherPos,_colour,_line_size,_line_brush] call A3A_fnc_NG_draw_line;
*/
params ["_name","_exists","_myPos","_otherPos","_colour","_line_size","_line_brush"];

private _radius = 0.5 * (_myPos distance2D _otherPos);
private _azimuth = _myPos getDir _otherPos;
private _centre = (_myPos vectorAdd _otherPos) vectorMultiply 0.5;

if (_exists) then {
    _name setMarkerPosLocal _centre;
} else {
    createMarkerLocal [_name, _centre];
};

_name setMarkerDirLocal _azimuth;
_name setMarkerShapeLocal "RECTANGLE";
_name setMarkerSizeLocal [_line_size, _radius];
_name setMarkerBrushLocal _line_brush;
_name setMarkerColor _colour;
