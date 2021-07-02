/*
Maintainer: Caleb Serafin
    Places a map marker on provided nav point.
    Colour depends on number of connections:
        0  -> Black
        1  -> Red
        2  -> Orange
        3  -> Yellow
        4  -> Green
        >4 -> Blue

Arguments:
    ARRAY<
        <POS2D>           Road pos.
        <SCALAR>          Island ID.
        <BOOLEAN>         isJunction.
        ARRAY<            Connections:
            <POS2D>           Connected road position.
            <SCALAR>          Road type Enumeration. {TRACK = 0; ROAD = 1; MAIN ROAD = 2} at time of writing.
            <SCALAR>          True driving distance to connection, includes distance of roads swallowed in simplification.
        >
    >
    <SCALAR> Size of road node dots. (Set to 0 to delete) (Default = 0.8)

Return Value:
    <ANY> undefined.

Scope: Local Arguments, Local Effect
Environment: Scheduled (Recommended) | Any (If small navGrid like Stratis, Malden)
Public: Yes

Example:
    [_aNavPoint] call A3A_fnc_NG_draw_dot;
*/
params [
    "_struct",
//    "_posRegionHM",
//    ["_posRegionHMSelection",[],[ [] ]],
    ["_dot_size",A3A_NGSA_dotBaseSize,[ 0 ]]
];
//private _useposRegionHM = ! isNil{_posRegionHM};

private _markerStructs = [localNamespace,"A3A_NGPP","draw","markers_road", createHashMap] call Col_fnc_nestLoc_get;
private _pos = _struct#0;
private _name = "A3A_NG_Dot_"+str _pos;
if (_dot_size > 0) then {
    private _const_dot_types = ["mil_dot","mil_triangle"];

    private _deadEnd = count (_struct#3) < 2;
    private _offRoad = nearestTerrainObjects [_pos, A3A_NG_const_roadTypeEnum, A3A_NG_const_positionInaccuracy, false, false] isEqualTo A3A_NG_const_emptyArray;
    private _specialColouring = [localNamespace,"A3A_NGPP","draw","specialColouring", "none"] call Col_fnc_nestLoc_get;
    private _colour = switch (_specialColouring) do {
        case "normalOffroad": {  // select by island ID
            switch (true) do {
                case (_deadEnd && _offRoad): { "ColorEAST" };
                case (_deadEnd): { "ColorRed" };
                case (_offRoad): { "ColorPink" };
                default { "ColorKhaki" };
            };
        };
        case "islandID": {  // select by island ID
            A3A_NGSA_const_allMarkerColours # ((_struct #1) mod A3A_NGSA_const_allMarkerColoursCount);
        };
        case "islandIDDeadEnd": {  // select by island ID
                if (_deadEnd) exitWith {A3A_NGSA_const_markerColourAccent1}; // MarkDeadEnds or islands
                A3A_NGSA_const_allMarkerColours # ((_struct #1) mod A3A_NGSA_const_allMarkerColoursCount);
        };
        default { // none
            A3A_NGSA_const_nodeConnectionColours getOrDefault [count (_struct#3) ,"ColorBlue"];
        };
    };

    private _exists = _markerStructs set [_name,true];
    if (_exists && (_offRoad)) then {  // Makes sure that the marker is on top when redrawn.
        deleteMarker _name;
        _exists = false;
    };

    if (!_exists) then {
        createMarkerLocal [_name,_pos];
        _name setMarkerTypeLocal (A3A_NGSA_const_nodeMarkerTypes select (_offRoad));   // Draw triangles where there are no roads.
    };
    if (abs (_pos#2) >= 0.5) then {   // Display ATL height of floating points.
        _name setMarkerTextLocal ((_pos#2 toFixed 1) + "m")
    };
    _name setMarkerSizeLocal [_dot_size, _dot_size];
    _name setMarkerColor _colour;
} else {
    deleteMarker _name;
    _markerStructs deleteAt _name;
};
