/*
Maintainer: Caleb Serafin
    Removes all connections and connection markers from a node.

Arguments:
    <navRoadHM>
    <POSATL>                Position to remove

Return Value:
    <ANY> Undefined

Scope: Any
Environment: Any
Public: No
Dependencies:
    <HASHMAP> A3A_NG_const_hashMap

Example:
    [_navGridHM,_posRegionHM,_pos] call A3A_fnc_NGSA_node_disconnect;
*/
params [
    ["_navGridHM",0,[A3A_NG_const_hashMap]],
    ["_pos",[],[ [] ],[3]]
];

private _marker_lines = [localNamespace,"A3A_NGPP","draw","markers_connectionLine",0] call Col_fnc_nestLoc_get;
private _structsToRefresh = [];

if (_pos in _navGridHM) then {
    private _struct = _navGridHM get _pos;
    private _connectedStructs = (_struct#3) apply {_navGridHM get (_x#0)};
    _structsToRefresh = _connectedStructs + [_struct];
    {
        private _connections = _x#3;
        _connections deleteAt (_connections findIf {(_x#0) isEqualTo _pos});

        private _midpoint = _pos vectorAdd (_x#0) vectorMultiply 0.5;
        private _name = "A3A_NG_Line_"+str _midPoint;
        if (_name in _marker_lines) then {
            deleteMarker _name;
            _marker_lines deleteAt _name;
        };
    } forEach _connectedStructs;
    (_struct#3) resize 0;
};


private _markerStructs = [localNamespace,"A3A_NGPP","draw","markers_road", 0] call Col_fnc_nestLoc_get; // Refresh marker junction colour
private _const_countColours = createHashMapFromArray [[0,"ColorBlack"],[1,"ColorRed"],[2,"ColorOrange"],[3,"ColorYellow"],[4,"ColorGreen"]];
{
    private _name = "A3A_NG_Dot_"+str (_x#0);
    if (_name in _markerStructs) then {
        _name setMarkerColor (_const_countColours getOrDefault [count (_x#3) ,"ColorBlue"]);
    };
} forEach _structsToRefresh;