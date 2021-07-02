/*
Maintainer: Caleb Serafin
    Places a map marker on points.
    Previous markers made by this function are deleted.
    Colour depends on number of connections:
        0  -> Black
        1  -> Red
        2  -> Orange
        3  -> Yellow
        4  -> Green
        >4 -> Blue

Arguments:
    <navGridHM>
//    <posRegionHM>
//    <ARRAY<SCALAR,SCALAR>> Nav regions to (re)draw.
    <SCALAR> Size of road node dots. (Set to 0 to disable) (Default = 0.8)

Return Value:
    <ANY> undefined.

Scope: Server, Global Effect
Environment: Scheduled (Recommended) | Any (If small navGrid like Stratis, Malden)
Public: Yes

Example:
    [_navGridHM] call A3A_fnc_NG_draw_dotOnRoads;
*/
params [
    "_navGridHM",
//    "_posRegionHM",
//    ["_posRegionHMSelection",[],[ [] ]],
    ["_dot_size",A3A_NGSA_dotBaseSize,[ 0 ]]
];
//private _useposRegionHM = ! isNil{_posRegionHM};

private _markerStructs_old = [localNamespace,"A3A_NGPP","draw","markers_road", createHashMap] call Col_fnc_nestLoc_get;
private _markerStructs_new = createHashMap;
[localNamespace,"A3A_NGPP","draw","markers_road",_markerStructs_new] call Col_fnc_nestLoc_set;

private _specialColouring = [localNamespace,"A3A_NGPP","draw","specialColouring", "none"] call Col_fnc_nestLoc_get;
private _colourDelegate = switch (_specialColouring) do {
    case "normalOffroad": {  // select by island ID
        {
            switch (true) do {
                case (_deadEnd && _offRoad): { "ColorEAST" };
                case (_deadEnd): { "ColorRed" };
                case (_offRoad): { "ColorPink" };
                default { "ColorKhaki" };
            };
        };
    };
    case "islandID": {  // select by island ID
        {A3A_NGSA_const_allMarkerColours # ((_struct #1) mod A3A_NGSA_const_allMarkerColoursCount)};
    };
    case "islandIDDeadEnd": {  // select by island ID
        {
            if (_deadEnd) exitWith {A3A_NGSA_const_markerColourAccent1}; // MarkDeadEnds or islands
            A3A_NGSA_const_allMarkerColours # ((_struct #1) mod A3A_NGSA_const_allMarkerColoursCount);
        };
    };
    default { // none
       {_const_countColours getOrDefault [count (_struct#3) ,"ColorBlue"]};
    };
};

if (_dot_size > 0) then {
    private _const_countColours = createHashMapFromArray [[0,"ColorBlack"],[1,"ColorRed"],[2,"ColorOrange"],[3,"ColorYellow"],[4,"ColorGreen"]];
    private _const_dot_size = [_dot_size, _dot_size];
    private _const_dot_types = ["mil_dot","mil_triangle"];
    {
        //if (_x inArea [[43000,41000],5000,5000,0,true]) then {

        private _pos = _x;
        private _struct = _navGridHM get _pos;
        private _name = "A3A_NG_Dot_"+str _pos;

        private _exists = _name in _markerStructs_old;
        _markerStructs_old deleteAt _name;
        _markerStructs_new set [_name,true];

        private _deadEnd = count (_struct#3) < 2;
        private _offRoad = nearestTerrainObjects [_pos, A3A_NG_const_roadTypeEnum, A3A_NG_const_positionInaccuracy, false, false] isEqualTo A3A_NG_const_emptyArray;

        if (_exists && (_offRoad)) then {  // Makes sure that the marker is on top when redrawn.
            deleteMarker _name;
            _exists = false;
        };

        if (!_exists) then {
            createMarkerLocal [_name,_pos];
            _name setMarkerTypeLocal (_const_dot_types select (_offRoad));   // Draw triangles where there are no roads.
        };
        if (abs (_pos#2) >= 0.5) then {   // Display ATL height of floating points.
            _name setMarkerTextLocal ((_pos#2 toFixed 1) + "m")
        };
        _name setMarkerSizeLocal _const_dot_size;
        _name setMarkerColor call _colourDelegate;
        //};
    } forEach _navGridHM;
};

{
    deleteMarker _x;
} forEach _markerStructs_old;
