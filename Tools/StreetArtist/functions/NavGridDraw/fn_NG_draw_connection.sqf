/*
Maintainer: Caleb Serafin
    Draws a line between the roads

Arguments:
    <navGridHM:element> NavPoint 1.
    <navGridHM:element> NavPoint 2.
    <SCALAR> Thickness of line, 1-high density, 2-normal, 8-Stratis world view, 16-Seattle world view. (Set to 0 to disable) (Default = 2)

Return Value:
    <ANY> Undefined

Scope:Any, Local Arguments, Global Effect
Environment: Scheduled
Public: Yes
Dependencies:
    <SCALAR> A3A_NGSA_modeConnect_roadTypeEnum

Example:
    [_left,_right] call A3A_fnc_NG_draw_connection;
*/
params [
    "_leftStruct",
    "_rightStruct",
    ["_roadTypeEnum",A3A_NGSA_modeConnect_roadTypeEnum,[0]],
    ["_thickness",A3A_NGSA_lineBaseSize,[0]]
];

private _markers_line = [localNamespace,"A3A_NGPP","draw","markers_connectionLine", createHashMap] call Col_fnc_nestLoc_get;

private _leftPos = _leftStruct#0;
private _rightPos = _rightStruct#0;

private _midPoint = _leftPos vectorAdd _rightPos vectorMultiply 0.5;
private _name = "A3A_NG_Line_"+str _midPoint;

if (_thickness > 0) then {

    private _radius = 0.5 * (_leftPos distance2D _rightPos);
    private _azimuth = _leftPos getDir _rightPos;

    private _const_roadColourClassification = ["ColorOrange","ColorYellow","ColorGreen"]; // ["TRACK", "ROAD", "MAIN ROAD"]
    private _specialColouring = [localNamespace,"A3A_NGPP","draw","specialColouring", "none"] call Col_fnc_nestLoc_get;
    private _colour = switch (_specialColouring) do {
        case "islandID": {  // select by island ID
            A3A_NGSA_const_allMarkerColours # ((_leftStruct #1) mod A3A_NGSA_const_allMarkerColoursCount);
        };
        case "islandIDDeadEnd": {  // select by island ID, no dead end marking involved
            A3A_NGSA_const_allMarkerColours # ((_leftStruct #1) mod A3A_NGSA_const_allMarkerColoursCount);
        };
        default { // normal & normalOffroad
            _const_roadColourClassification #_roadTypeEnum;
        };
    };

    private _exists = _name in _markers_line;
    if !(_exists) then {
        createMarkerLocal [_name, _midPoint];
    };
    _markers_line set [_name,true];

    _name setMarkerDirLocal _azimuth;
    _name setMarkerShapeLocal "RECTANGLE";
    _name setMarkerSizeLocal [_thickness, _radius];
    _name setMarkerBrushLocal "Solid";
    _name setMarkerColor _colour;
} else {
    deleteMarker _name;
    _markers_line deleteAt _name;
};






