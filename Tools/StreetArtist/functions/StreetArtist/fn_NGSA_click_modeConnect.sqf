/*
Maintainer: Caleb Serafin
    Performs per node actions:
    Select and deselecting nodes.
    Connecting and disconnecting nodes.
    Adding and removing nodes.

Arguments:
    <POS2D> _worldPos
    <BOOLEAN> _shift
    <BOOLEAN> _ctrl, Currently unused.
    <BOOLEAN> _alt

Return Value:
    <ANY> nil is not action. <BOOLEAN> True if action.

Scope: Client, Local Arguments, Local Effect
Environment: Unscheduled
Public: No
Dependencies:
    <HASHMAP> nestLoc entry at (localNamespace >> "A3A_NGPP" >> "posRegionHM")
    <HASHMAP> nestLoc entry at (localNamespace >> "A3A_NGPP" >> "navGridHM")

Example:
    [_worldPos ,_shift, _ctrl, _alt] call A3A_fnc_NGSA_click_modeConnect;
*/
params ["_worldPos", "_shift", "_ctrl", "_alt"];

private _deselect = {
    A3A_NGSA_modeConnect_selectedExists = false;
    A3A_NGSA_modeConnect_selectedNode = [];
};
private _select = {
    A3A_NGSA_modeConnect_selectedNode = A3A_NGSA_modeConnect_targetNode;
    A3A_NGSA_modeConnect_selectedExists = true;

    A3A_NGSA_UI_marker1_pos = A3A_NGSA_modeConnect_selectedNode#0;
    A3A_NGSA_UI_marker1_name setMarkerPos A3A_NGSA_UI_marker1_pos; // Broadcasts marker attributes here
};

private _actionFired = true;
switch (true) do {       // Broadcast here.
    // Add a node by holding shift and clicking.
    case (_shift && !A3A_NGSA_modeConnect_targetExists): {
        private _navGridHM = [localNamespace,"A3A_NGPP","navGridHM",0] call Col_fnc_nestLoc_get;
        private _posRegionHM = [localNamespace,"A3A_NGPP","navGridPosRegionHM",0] call Col_fnc_nestLoc_get;
        if ([A3A_NGSA_UI_marker0_pos, _navGridHM, _posRegionHM] call A3A_fnc_NGSA_canAddPos) then {
            A3A_NGSA_modeConnect_targetNode = [A3A_NGSA_UI_marker0_pos,0,false,[]];

            [_navGridHM,_posRegionHM,A3A_NGSA_UI_marker0_pos,A3A_NGSA_modeConnect_targetNode] call A3A_fnc_NGSA_pos_add;    // Island ID may not be accurate.
            [A3A_NGSA_modeConnect_targetNode] call A3A_fnc_NG_draw_dot;

            private _isConnected = false;
            if (A3A_NGSA_modeConnect_selectedExists) then {
                _isConnected = [A3A_NGSA_modeConnect_selectedNode,A3A_NGSA_modeConnect_targetNode,A3A_NGSA_modeConnect_roadTypeEnum] call A3A_fnc_NGSA_toggleConnection;
            };
            if (_isConnected && {[_navGridHM, A3A_NGSA_modeConnect_selectedNode#0, A3A_NGSA_modeConnect_targetNode#0] call A3A_fnc_NGSA_shouldAddMiddleNode}) then {
                [A3A_NGSA_modeConnect_selectedNode,A3A_NGSA_modeConnect_targetNode,_navGridHM,_posRegionHM] call A3A_fnc_NGSA_insertMiddleNode;
            };
            call _select;
            call A3A_fnc_NGSA_refreshMarkerOrder;
            call A3A_fnc_NGSA_action_autoRefresh;
        };
    };
    // Deselect node by clicking into empty space.
    case (A3A_NGSA_modeConnect_selectedExists && !A3A_NGSA_modeConnect_targetExists): _deselect;
    // Deselect node then delete node under cursor by holding alt.
    case (_alt): {
        private _navGridHM = [localNamespace,"A3A_NGPP","navGridHM",0] call Col_fnc_nestLoc_get;
        private _posRegionHM = [localNamespace,"A3A_NGPP","navGridPosRegionHM",0] call Col_fnc_nestLoc_get;
        [_navGridHM,A3A_NGSA_UI_marker0_pos] call A3A_fnc_NGSA_node_disconnect;
        [_navGridHM,_posRegionHM,A3A_NGSA_UI_marker0_pos] call A3A_fnc_NGSA_pos_rem;    // Island ID will not be accurate.

        private _markerStructs = [localNamespace,"A3A_NGPP","draw","markers_road", 0] call Col_fnc_nestLoc_get;
        private _name = "A3A_NG_Dot_"+str A3A_NGSA_UI_marker0_pos;
        deleteMarker _name;
        _markerStructs deleteAt _name;
        call A3A_fnc_NGSA_action_autoRefresh;
    };
    // Select node
    case (!A3A_NGSA_modeConnect_selectedExists && A3A_NGSA_modeConnect_targetExists): _select;
    // Deselect by clicking on same node.
    case (A3A_NGSA_modeConnect_selectedExists && (A3A_NGSA_modeConnect_selectedNode isEqualTo A3A_NGSA_modeConnect_targetNode)): _deselect;
    // Connect two nodes.
    case (A3A_NGSA_modeConnect_selectedExists && A3A_NGSA_modeConnect_targetExists): {
        private _isConnected = [A3A_NGSA_modeConnect_selectedNode,A3A_NGSA_modeConnect_targetNode,A3A_NGSA_modeConnect_roadTypeEnum] call A3A_fnc_NGSA_toggleConnection;
        private _navGridHM = [localNamespace,"A3A_NGPP","navGridHM",0] call Col_fnc_nestLoc_get;
        private _posRegionHM = [localNamespace,"A3A_NGPP","navGridPosRegionHM",0] call Col_fnc_nestLoc_get;
        if (_isConnected && {[_navGridHM, A3A_NGSA_modeConnect_selectedNode#0, A3A_NGSA_modeConnect_targetNode#0] call A3A_fnc_NGSA_shouldAddMiddleNode}) then {
            [A3A_NGSA_modeConnect_selectedNode,A3A_NGSA_modeConnect_targetNode,_navGridHM,_posRegionHM] call A3A_fnc_NGSA_insertMiddleNode;
        };

        //[A3A_NGSA_modeConnect_selectedNode,A3A_NGSA_modeConnect_targetNode,_navGridHM,_posRegionHM] call A3A_fnc_NGSA_insertMiddleNode;
        call _select;
        call A3A_fnc_NGSA_refreshMarkerOrder;
        call A3A_fnc_NGSA_action_autoRefresh;
    };
    // This isn't likely to run. But if it does in the future due to changes, it won't do anything.
    default {
        _actionFired = nil
    }
};
_actionFired;
