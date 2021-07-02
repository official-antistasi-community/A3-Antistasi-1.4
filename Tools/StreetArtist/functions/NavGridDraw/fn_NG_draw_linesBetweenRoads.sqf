/*
Maintainer: Caleb Serafin
    Draws lines between nodes.
    Previous markers make by this function are deleted.
    Colour depends on road type:
        MAIN ROAD  -> Green
        ROAD  -> Yellow
        TRACK  -> Orange

Arguments:
    <navGridHM>
    <SCALAR> Thickness of line, 1-high density, 4-normal, 8-Stratis world view, 16-Seattle world view. (Set to 0 to disable) (Default = 4)
    <BOOLEAN> False if line partially transparent, true if solid and opaque. (Default = false)
    <BOOLEAN> True to draw distance between road segments. (Only draws if above 5m) (Default = false)

Return Value:
    <ANY> undefined.

Scope: Any, Global Arguments, Global Effect
Environment: Scheduled
Public: Yes

Example:
    [_navGridHM,4,true,false] spawn A3A_fnc_NG_draw_linesBetweenRoads;
*/
params [
    "_navGridHM",
    ["_line_size",4,[ 0 ]],
    ["_line_opaque",false,[ false ]],
    ["_drawDistance",false,[ false ]]
];

private _fnc_diag_report = {
    params ["_diag_step_main"];
    ["Drawing Lines",_diag_step_main,true,200] call A3A_fnc_customHint;
};
private _const_roadColourClassification = ["ColorOrange","ColorYellow","ColorGreen"]; // ["TRACK", "ROAD", "MAIN ROAD"]
private _diag_totalSegments = count _navGridHM;

private _markers_old_line = [localNamespace,"A3A_NGPP","draw","markers_connectionLine", createHashMap] call Col_fnc_nestLoc_get;
private _markers_new_line = createHashMap;
[localNamespace,"A3A_NGPP","draw","markers_connectionLine", _markers_new_line] call Col_fnc_nestLoc_set;

private _markers_old_distance = [localNamespace,"A3A_NGPP","draw","markers_connectionText", createHashMap] call Col_fnc_nestLoc_get;
private _markers_new_distance = createHashMap;
[localNamespace,"A3A_NGPP","draw","markers_connectionText", _markers_new_distance] call Col_fnc_nestLoc_set;

private _specialColouring = [localNamespace,"A3A_NGPP","draw","specialColouring", "none"] call Col_fnc_nestLoc_get;
private _colourDelegate = switch (_specialColouring) do {
    case "islandID": {  // select by island ID
        {A3A_NGSA_const_allMarkerColours # ((_myStruct #1) mod A3A_NGSA_const_allMarkerColoursCount)};
    };
    case "islandIDDeadEnd": {  // select by island ID, no dead end marking involved
        {A3A_NGSA_const_allMarkerColours # ((_myStruct #1) mod A3A_NGSA_const_allMarkerColoursCount)};
    };
    default { // normal & normalOffroad
       {_const_roadColourClassification #(_x#1)};
    };
};

if (_line_size > 0 || _drawDistance) then {
    private _processedMidPoints = createHashMap;

    private _line_brush = ["Solid","SolidFull"] select _line_opaque;
    {
        if (_forEachIndex mod 100 == 0) then {
            ("Completion &lt;" + ((100*_forEachIndex /_diag_totalSegments) toFixed 1) + "% &gt; Processing segment &lt;" + (str _forEachIndex) + " / " + (str _diag_totalSegments) + "&gt;") call _fnc_diag_report;
        };

        private _myPos = _x;
        private _myStruct = _navGridHM get _x;
        {
            private _otherPos = _x#0;
            private _midPoint = _myPos vectorAdd _otherPos vectorMultiply 0.5;

            if !(_midPoint in _processedMidPoints) then {
                _processedMidPoints set [_midPoint,true];
                //if !(_midPoint inArea [[43000,41000],5000,5000,0,true]) exitWith {};

                if (_line_size > 0) then {
                    private _name = "A3A_NG_Line_"+str _midPoint;
                    private _exists = _name in _markers_old_line;
                    _markers_old_line deleteAt _name;
                    _markers_new_line set [_name,true];

                    [_name,_exists,_myPos,_otherPos,call _colourDelegate,_line_size,_line_brush] call A3A_fnc_NG_draw_line;
                };

                private _realDistance = _x#2;
                if (_drawDistance && (_realDistance > 5)) then {
                    private _name = "A3A_NG_Dist_"+str _midPoint;
                    private _exists = _name in _markers_old_distance;
                    _markers_old_distance deleteAt _name;
                    _markers_new_distance set [_name,true];

                    [_name,_exists,_midPoint,call _colourDelegate,(_realDistance toFixed 0) + "m"] call A3A_fnc_NG_draw_text;
                };
            };
        } forEach (_myStruct #3);
    } forEach keys _navGridHM;
};
{
    deleteMarker _x;
} forEach _markers_old_line;
{
    deleteMarker _x;
} forEach _markers_old_distance;

"Done drawing lines." call _fnc_diag_report;
