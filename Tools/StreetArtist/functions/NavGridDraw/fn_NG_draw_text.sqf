/*
Maintainer: Caleb Serafin
    Draws text left of point.

Arguments:
    <STRING> Marker name.
    <BOOL> If marker already exists.
    <POS2D> Text left point
    <STRING> Marker Colour eg "ColorOrange"
    <STRING> Text

Return Value:
    <STRING> Full marker name (including the prefix).

Scope:Any, Local Arguments, Global Effect
Environment: Scheduled
Public: Yes

Example:
    [_name,_exists,_midPoint,_colour,(_realDistance toFixed 0) + "m"] call A3A_fnc_NG_draw_text;
*/
params ["_name","_exists","_midPoint","_colour","_text"];

if !(_exists) then {
    createMarkerLocal [_name,_midPoint];
    _name setMarkerTypeLocal "mil_dot";
    _name setMarkerSizeLocal [0.01, 0.01];  // We do not want the dot to be visible.
};

_name setMarkerTextLocal _text;
_name setMarkerColor _colour;
