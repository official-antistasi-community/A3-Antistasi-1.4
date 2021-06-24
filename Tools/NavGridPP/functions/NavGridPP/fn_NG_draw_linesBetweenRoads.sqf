/*
Maintainer: Caleb Serafin
    Draws lines between nodes.
    Previous markers make by this function are deleted.
    Colour depends on road type:
        MAIN ROAD  -> Green
        ROAD  -> Yellow
        TRACK  -> Orange

Arguments:
    <ARRAY<             navIslands:
        <ARRAY<             A single road network island:
            <OBJECT>            Road
            <ARRAY<OBJECT>>         Connected roads.
            <ARRAY<SCALAR>>         True driving distance in meters to connected roads.
        >>
    >>
    <SCALAR> Thickness of line, 1-high density, 4-normal, 8-Stratis world view, 16-Seattle world view. (Set to 0 to disable) (Default = 4)
    <BOOLEAN> False if line partially transparent, true if solid and opaque. (Default = false)
    <BOOLEAN> True to draw distance between road segments. (Only draws if above 5m) (Default = false)

Return Value:
    <ANY> undefined.

Scope: Any, Global Arguments, Global Effect
Environment: Scheduled
Public: Yes

Example:
    [_navIslands,true,false] call A3A_fnc_NG_draw_linesBetweenRoads;
*/
params [
    ["_navIslands",[],[ [] ]], //<ARRAY< island ARRAY<Road,connections ARRAY<Road>>  >>
    ["_line_size",4,[ 0 ]],
    ["_line_opaque",false,[ false ]],
    ["_drawDistance",false,[ false ]]
];

if !(_line_size > 0 || _drawDistance) exitWith {};

private _diag_step_main = "";
private _diag_step_sub = "";


private _fnc_diag_render = { // call _fnc_diag_render;
    [
        "Nav Grid++ Draw",
        "<t align='left'>" +
        "Drawing lines between roads<br/>"+
        _diag_step_main+"<br/>"+
        _diag_step_sub+"<br/>"+
        "</t>"
    ] remoteExec ["A3A_fnc_customHint",0];
};

_diag_step_main = "Deleting Old Markers";
call _fnc_diag_render;
private _markers = [localNamespace,"NavGridPP","draw","LinesBetweenRoads",[]] call Col_fnc_nestLoc_get;
{
    deleteMarker _x;
} forEach _markers;
_markers resize 0;  // Preserves reference
private _roadColourClassification = [["MAIN ROAD", "ROAD", "TRACK"],["ColorGreen","ColorYellow","ColorOrange"]];

{

    _diag_step_main = "Drawing Lines on island &lt;" + str _forEachIndex + " / " + str count _navIslands + "&gt;";
    call _fnc_diag_render;
    private _diag_sub_counter = -1;
    private _segments = _x;
    _diag_totalSegments = count _segments;

    private _roadsAndConnections = [localNamespace,"NavGridPP","draw","linesBetweenRoads_roadAndConnections", nil, nil] call Col_fnc_nestLoc_set;
    {
        _diag_sub_counter = _diag_sub_counter +1;
        if (_diag_sub_counter mod 100 == 0) then {
            _diag_step_sub = "Completion &lt;" + ((100*_forEachIndex /_diag_totalSegments) toFixed 1) + "% &gt; Processing segment &lt;" + (str _forEachIndex) + " / " + (str _diag_totalSegments) + "&gt;";
            call _fnc_diag_render;
        };

        private _segStruct = _x;
        private _myRoad = _segStruct#0;
        private _myName = str _myRoad;
        {
            private _otherRoad = _x;
            private _otherName = str _otherRoad;
            private _myConnections = _roadsAndConnections getVariable [_myName,[]];
            if !(_otherName in _myConnections) then {
                _myConnections pushBack _otherName;
                _roadsAndConnections setVariable [_myName,_myConnections];

                private _otherConnections = _roadsAndConnections getVariable [_otherName,[]];
                _otherConnections pushBack _myName;
                _roadsAndConnections setVariable [_otherName,_otherConnections];
                private _realDistance = _segStruct #2 #_forEachIndex;

                if (_line_size > 0) then {
                    _markers pushBack ([_myRoad,_otherRoad,_myName + _otherName,_roadColourClassification,_line_size,_line_opaque] call A3A_fnc_NG_draw_lineBetweenTwoRoads);
                };
                if (_drawDistance && (_realDistance > 5)) then { // disabled just for road clarity
                    _markers pushBack ([_myRoad,_otherRoad,_myName + _otherName,_roadColourClassification,(_realDistance toFixed 0) + "m"] call A3A_fnc_NG_draw_distanceBetweenTwoRoads);
                };
            };

        } forEach (_segStruct#1); // connections ARRAY<Road>  // _x is Road
    } forEach _segments;   // island ARRAY<Road,connections ARRAY<Road>>  // _x is <Road,connections ARRAY<Road>>
    [_roadsAndConnections] call Col_fnc_nestLoc_rem;

} forEach _navIslands; //<ARRAY< island ARRAY<Road,connections ARRAY<Road>>  >>// _x is <island ARRAY<Road,connections ARRAY<Road>>>

[localNamespace,"NavGridPP","draw","LinesBetweenRoads",_markers] call Col_fnc_nestLoc_set;


_diag_step_main = "Done drawing lines.";
_diag_step_sub = "";
call _fnc_diag_render;