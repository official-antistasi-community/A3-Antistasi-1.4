/*
Maintainer: Caleb Serafin
    Displays coloured markers for node actions:
    Select and deselecting nodes.
    Connecting and disconnecting nodes.
    Adding and removing nodes.
    May also set variables up for click_modeConnect.

Arguments:
    <DISPLAY> _display
    <SCALAR> _button
    <SCALAR> _xPos
    <SCALAR> _yPos
    <BOOLEAN> _shift
    <BOOLEAN> _ctrl
    <BOOLEAN> _alt

Return Value:
    <BOOLEAN> true if deleted, false if not found.

Scope: Client, Local Arguments, Local Effect
Environment: Unscheduled
Public: No
Dependencies:
    <HASHMAP> nestLoc entry at (localNamespace >> "A3A_NGPP" >> "posRegionHM")
    <HASHMAP> nestLoc entry at (localNamespace >> "A3A_NGPP" >> "navGridHM")
    <ARRAY> A3A_NG_const_emptyArray

Example:
    [_worldPos ,_shift, _ctrl, _alt] call A3A_fnc_NGSA_hover_modeConnect;
*/
params ["_worldPos"];

private _navGridPosRegionHM = [localNamespace,"A3A_NGPP","navGridPosRegionHM",0] call Col_fnc_nestLoc_get;
private _navGridHM = [localNamespace,"A3A_NGPP","navGridHM",0] call Col_fnc_nestLoc_get;

private _showAddNode = "shift" in A3A_NGSA_depressedKeysHM;

private _targetPos = _worldPos;
private _closestDistance = [A3A_NGSA_maxSelectionRadius,2*A3A_NG_const_positionInaccuracy] select _showAddNode; // Prioritise adding roads.
{
    private _distance = _x distance2D _worldPos;
    if (_distance < _closestDistance) then {
        _closestDistance = _distance;
        _targetPos = _x;
    };
} forEach ([_navGridPosRegionHM,_worldPos] call A3A_fnc_NGSA_posRegionHM_allAdjacent);

A3A_NGSA_modeConnect_targetExists = _targetPos in _navGridHM;
if (A3A_NGSA_modeConnect_targetExists) then {
    A3A_NGSA_modeConnect_targetNode = _navGridHM get _targetPos;
};

private _disconnectAction = A3A_NGSA_modeConnect_selectedExists && A3A_NGSA_modeConnect_targetExists && {A3A_NGSA_modeConnect_targetNode#3 findIf {_x#0 isEqualTo (A3A_NGSA_modeConnect_selectedNode#0)} != -1}; // Node under cursor is connected to select node.
// Leash connection length while allowing unlink to work at longer distances.
if (A3A_NGSA_modeConnect_selectedExists && !_disconnectAction && {A3A_NGSA_modeConnect_selectedNode#0 distance2D _targetPos > A3A_NGSA_const_maxConnectionLength}) then {
    private _azimuth = A3A_NGSA_modeConnect_selectedNode#0 getDir _targetPos;
    _targetPos = [A3A_NGSA_modeConnect_selectedNode#0 getPos [A3A_NGSA_const_maxConnectionLength,_azimuth]] call A3A_fnc_NGSA_getSurfaceATL;
    A3A_NGSA_modeConnect_targetExists = false
};

if (_showAddNode) then {
    private _nearRoads = nearestTerrainObjects [_targetPos, A3A_NG_const_roadTypeEnum, A3A_NGSA_maxSelectionRadius, true, true] select {!isNil{getRoadInfo _x #0} && {getRoadInfo _x #0 in A3A_NG_const_roadTypeEnum}};  // Bad roads need to be filtered out.
    if (count _nearRoads > 0) then {
        _showAddNode = !(getPosATL (_nearRoads#0) in _navGridHM); // Cannot add the same road.
    };
};

private _lineColour = ["ColorOrange","ColorYellow","ColorGreen"] #A3A_NGSA_modeConnect_roadTypeEnum; // ["TRACK", "ROAD", "MAIN ROAD"]
private _lineStartPos = +A3A_NGSA_UI_marker1_pos;
private _lineEndPos = _targetPos;
private _lineBrush = "SolidFull";

if (A3A_NGSA_toolModeChanged) then {
    A3A_NGSA_UI_marker1_name setMarkerShapeLocal "ICON";
    A3A_NGSA_UI_marker0_name setMarkerShapeLocal "ICON";
};
/*
Marker0 is used for icon under cursor.
Marker1 is used for selected node.
*/

A3A_NGSA_UI_marker1_name setMarkerSizeLocal [A3A_NGSA_dotBaseSize*0.8, A3A_NGSA_dotBaseSize*0.8];
A3A_NGSA_UI_marker1_name setMarkerType (["Empty","mil_start"] select (A3A_NGSA_modeConnect_selectedExists && _targetPos isNotEqualTo A3A_NGSA_UI_marker1_pos));       // Broadcasts for selected marker.
A3A_NGSA_UI_marker1_name setMarkerColorLocal _lineColour;

A3A_NGSA_UI_marker0_name setMarkerSizeLocal [A3A_NGSA_dotBaseSize*0.8, A3A_NGSA_dotBaseSize*0.8];
switch (true) do {       // Broadcast here.
    case (_showAddNode): {                       // Add new node
        private _nearRoads = nearestTerrainObjects [_targetPos, A3A_NG_const_roadTypeEnum, A3A_NGSA_maxSelectionRadius, true, true] select {!isNil{getRoadInfo _x #0} && {getRoadInfo _x #0 in A3A_NG_const_roadTypeEnum}};  // Bad roads need to be filtered out.
        if (A3A_NGSA_modeConnect_selectedExists) then {
            _nearRoads = _nearRoads select {A3A_NGSA_modeConnect_selectedNode#0 distance2D _x <= A3A_NGSA_const_maxConnectionLength};
        };
        if (count _nearRoads > 0) then {
            _targetPos = getPosATL (_nearRoads#0);
        };
        _lineEndPos = _targetPos;
        A3A_NGSA_UI_marker0_name setMarkerSizeLocal [A3A_NGSA_dotBaseSize, A3A_NGSA_dotBaseSize];
        A3A_NGSA_UI_marker0_name setMarkerTypeLocal (["mil_triangle","mil_dot"] select (count _nearRoads > 0));
        A3A_NGSA_UI_marker0_name setMarkerColorLocal "ColorBlack";
    };
    case ("alt" in A3A_NGSA_depressedKeysHM): {                         // Deselect current. Delete node.
        A3A_NGSA_modeConnect_selectedExists = false;
        A3A_NGSA_modeConnect_selectedNode = [];
        A3A_NGSA_UI_marker0_name setMarkerTypeLocal "KIA";
        A3A_NGSA_UI_marker0_name setMarkerColorLocal "ColorBlack";
        A3A_NGSA_UI_marker1_name setMarkerType "Empty";
    };
    case (!A3A_NGSA_modeConnect_targetExists && !A3A_NGSA_modeConnect_selectedExists): {    // Nothing under cursor, and nothing selected // Nothing
        A3A_NGSA_UI_marker0_name setMarkerTypeLocal "selector_selectable";
        A3A_NGSA_UI_marker0_name setMarkerColorLocal "ColorBlack";
    };
    case (!A3A_NGSA_modeConnect_targetExists): {                        // Nothing under cursor, there is a node selected. //Deselect
        _lineEndPos = _targetPos;
        A3A_NGSA_UI_marker0_name setMarkerSizeLocal [1.2,1.2];
        _lineBrush = "DiagGrid";
        A3A_NGSA_UI_marker0_name setMarkerTypeLocal "waypoint";
        A3A_NGSA_UI_marker0_name setMarkerColorLocal "ColorBlack";
    };
    case (!A3A_NGSA_modeConnect_selectedExists): {                      // Node under cursor, nothing selected. // Select
        A3A_NGSA_UI_marker0_name setMarkerTypeLocal "selector_selectable";
        A3A_NGSA_UI_marker0_name setMarkerColorLocal "ColorBlack";
    };
    case (_targetPos isEqualTo A3A_NGSA_UI_marker1_pos): { // Already selected node under cursor. // Deselect
        A3A_NGSA_UI_marker0_name setMarkerSizeLocal [1.2,1.2];
        A3A_NGSA_UI_marker0_name setMarkerTypeLocal "waypoint";
        A3A_NGSA_UI_marker0_name setMarkerColorLocal "ColorBlack";
    };
    case (_disconnectAction): { // Node under cursor is connected to select node. // Disconnect nodes.
        _lineColour = "ColorRed";
        _lineBrush = "DiagGrid";
        A3A_NGSA_UI_marker0_name setMarkerTypeLocal "mil_objective";
        A3A_NGSA_UI_marker0_name setMarkerColorLocal "ColorRed";
        A3A_NGSA_UI_marker1_name setMarkerType "mil_objective";
        A3A_NGSA_UI_marker1_name setMarkerColorLocal "ColorRed";
    };
    default {                                                           // Node under cursor, and a node is selected // Connect nodes.
        A3A_NGSA_UI_marker0_name setMarkerType "mil_pickup";
        A3A_NGSA_UI_marker0_name setMarkerColorLocal _lineColour;
    };
};
private _cursorInformation = "        H:" + (A3A_NGSA_UI_marker0_pos#2 toFixed 2) + "m";  // The space allows to to avoid the map coord text.
if (A3A_NGSA_modeConnect_selectedExists) then {
    _cursorInformation = _cursorInformation + "  L:" + (A3A_NGSA_modeConnect_selectedNode#0 distance2D _targetPos toFixed 2) + "m";
};
A3A_NGSA_UI_marker0_name setMarkerTextLocal _cursorInformation;
A3A_NGSA_UI_marker0_pos = _targetPos;
A3A_NGSA_UI_marker0_name setMarkerPos (A3A_NGSA_UI_marker0_pos vectorAdd [0,0.01,0]);  // The shift allows markers beneath it be be clicked on.; // Broadcasts marker attributes here



if (A3A_NGSA_modeConnect_selectedExists) then {
    A3A_NGSA_modeConnect_lineName setMarkerAlphaLocal 1;
    [A3A_NGSA_modeConnect_lineName,true,_lineStartPos,_lineEndPos,_lineColour,A3A_NGSA_lineBaseSize,_lineBrush] call A3A_fnc_NG_draw_line;
};