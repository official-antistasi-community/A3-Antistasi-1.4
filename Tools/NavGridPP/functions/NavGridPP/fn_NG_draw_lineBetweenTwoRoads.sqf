/*
Maintainer: Caleb Serafin
    Draws a line between the roads
    The colour depends on the maximum road type given in the road type specification.

Arguments:
    <ARRAY<
    <OBJECT> Road 1
    <OBJECT> Road 2
    <STRING> Marker ID. Note: "NGPP_line_" is prefixed to the ID.
    <ARRAY<             road colour classification
        <ARRAY<STRING>>     Types of roads (Maximum takes preference)
        <ARRAY<STRING>>     Marker Colours (corresponding to Types of roads)
    >>
    <SCALAR> Thickness of line, 1-high density, 2-normal, 8-Stratis world view, 16-Seattle world view. (Set to 0 to disable) (Default = 2)
    <BOOLEAN> False if line partially transparent, true if solid and opaque. (Default = false)

Return Value:
    <STRING> Full marker name (including the prefix).

Scope:Any, Local Arguments, Global Effect
Environment: Scheduled
Public: No

Example:
    _markers pushBack ([_myRoad,_otherRoad,_myName + _otherName,_roadColourClassification] call A3A_fnc_NG_draw_lineBetweenTwoRoads);
*/
params ["_myRoad","_otherRoad","_markerID","_roadColourClassification","_line_size","_line_opaque"];

private _myPos = getPos _myRoad;
private _otherPos = getPos _otherRoad;

private _radius = 0.5 * (_myPos distance2D _otherPos);
private _azimuth = _myPos getDir _otherPos;
private _centre = (_myPos vectorAdd _otherPos) vectorMultiply 0.5;

private _name = "NGPP_line_" + _markerID;
private _marker = createMarkerLocal [_name, _centre];
_marker setMarkerDirLocal _azimuth;
_marker setMarkerSizeLocal [_line_size, _radius];
_marker setMarkerShapeLocal "RECTANGLE";
_marker setMarkerBrushLocal (["Solid","SolidFull"] select _line_opaque);

private _types = _roadColourClassification#0;
private _colourScore = (_types find (getRoadInfo _myRoad #0)) max (_types find (getRoadInfo _otherRoad #0));
//*
if (_colourScore == -1) then {
    _marker setMarkerColor "ColorBlack";
} else {
    _marker setMarkerColor (_roadColourClassification #1 #_colourScore);
};
//*/
//_marker setMarkerColor selectRandom ["ColorBlack","ColorGrey","ColorRed","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorBlue","ColorPink","ColorWhite","ColorWEST","ColorEAST","ColorGUER","ColorCIV","ColorUNKNOWN","colorBLUFOR","colorOPFOR","colorIndependent","colorCivilian","Color1_FD_F","Color2_FD_F","Color3_FD_F","Color4_FD_F","Color5_FD_F","Color6_FD_F"];

_marker;

