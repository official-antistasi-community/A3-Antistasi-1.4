/*
Maintainer: Caleb Serafin
    Performs bulk actions on nodes under selection:
    Set node types.
    Delete nodes.

Arguments:
    <POS2D> _worldPos
    <BOOLEAN> _shift unused for now
    <BOOLEAN> _ctrl unused for now
    <BOOLEAN> _alt

Return Value:
    <BOOLEAN> true if deleted, false if not found.

Scope: Client, Local Arguments, Local Effect
Environment: Unscheduled
Public: No
Dependencies:
    <HASHMAP> nestLoc entry at (localNamespace >> "A3A_NGPP" >> "posRegionHM")
    <HASHMAP> nestLoc entry at (localNamespace >> "A3A_NGPP" >> "navGridHM")

Example:
    [_worldPos ,_shift, _ctrl, _alt] call A3A_fnc_NGSA_click_modeBrush;
*/
params ["_worldPos", "_shift", "_ctrl", "_alt"];

private _navGridHM = [localNamespace,"A3A_NGPP","navGridHM",0] call Col_fnc_nestLoc_get;
private _navGridPosRegionHM = [localNamespace,"A3A_NGPP","navGridPosRegionHM",0] call Col_fnc_nestLoc_get;

private _allPositions = ([_navGridPosRegionHM,_worldPos,A3A_NGSA_brushSelectionRadius] call A3A_fnc_NGSA_posRegionHM_pixelRadius) select {_x distance2D _worldPos < A3A_NGSA_brushSelectionRadius};

switch (true) do {
    case (_alt): {
        private _markerStructs = [localNamespace,"A3A_NGPP","draw","markers_road", 0] call Col_fnc_nestLoc_get;
        {
            [_navGridHM,_x] call A3A_fnc_NGSA_node_disconnect;
            [_navGridHM,_navGridPosRegionHM,_x] call A3A_fnc_NGSA_pos_rem;    // Island ID will not be accurate.

            private _name = "A3A_NG_Dot_"+str _x;
            deleteMarker _name;
            _markerStructs deleteAt _name;
        } forEach _allPositions;
    };
    default {
        private _marker_line_colour = ["ColorOrange","ColorYellow","ColorGreen"] #A3A_NGSA_modeConnect_roadTypeEnum;
        private _processedConnection = createHashMap;
        {
            private _nodePos = _x;
            private _node = _navGridHM get _x;
            {
                private _midPoint = _nodePos vectorAdd (_x#0) vectorMultiply 0.5;
                if !(_midPoint in _processedConnection) then {
                    _processedConnection set [_midPoint,true];
                    if ((_x#1) == A3A_NGSA_modeConnect_roadTypeEnum) exitWith {};
                    _x set [1,A3A_NGSA_modeConnect_roadTypeEnum];

                    private _conNodeCons = (_navGridHM get (_x#0))#3;
                    (_conNodeCons #(_conNodeCons findIf {_x#0 isEqualTo _nodePos})) set [1,A3A_NGSA_modeConnect_roadTypeEnum];

                    ("A3A_NG_Line_"+str _midPoint) setMarkerColor _marker_line_colour;
                };
            } forEach (_node#3);
        } forEach _allPositions;
    };
};