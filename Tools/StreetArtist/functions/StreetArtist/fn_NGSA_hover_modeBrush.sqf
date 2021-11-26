/*
Maintainer: Caleb Serafin
    Displays coloured markers to indicate bulk actions on nodes under selection:
    Set node types.
    Delete nodes.

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
    scalar _fullSelectionRadius in parent scope
    <HASHMAP> nestLoc entry at (localNamespace >> "A3A_NGPP" >> "posRegionHM")
    <HASHMAP> nestLoc entry at (localNamespace >> "A3A_NGPP" >> "navGridHM")

Example:
    [_worldPos ,_shift, _ctrl, _alt] call A3A_fnc_NGSA_hover_modeConnect;
*/
params ["_worldPos"];


A3A_NGSA_brushSelectionRadius = _fullSelectionRadius;      // Can be much bigger as it fetches all map regions within a pixelated circle. Too big will still slow down.
A3A_NGSA_modeConnect_lineName setMarkerAlpha 0;// Broadcasts
if ("shift" in A3A_NGSA_depressedKeysHM) then {
    A3A_NGSA_brushSelectionRadius = (A3A_NGSA_brushSelectionRadius*2) min 2000;    // Is reset every cycle, so it won't keep growing.
};

if (A3A_NGSA_toolModeChanged) then {
    A3A_NGSA_UI_marker0_name setMarkerTextLocal "";
    A3A_NGSA_UI_marker0_name setMarkerShapeLocal "ELLIPSE";
    A3A_NGSA_UI_marker1_name setMarkerShapeLocal "ELLIPSE";
    A3A_NGSA_UI_marker1_name setMarkerBrushLocal "Border";
};
/*
Marker0 is used for fill.
Marker1 is used for border.
*/
A3A_NGSA_UI_marker0_name setMarkerSizeLocal [A3A_NGSA_brushSelectionRadius, A3A_NGSA_brushSelectionRadius];
A3A_NGSA_UI_marker1_name setMarkerSizeLocal [A3A_NGSA_brushSelectionRadius, A3A_NGSA_brushSelectionRadius];
switch (true) do {
    case ("alt" in A3A_NGSA_depressedKeysHM): {
        A3A_NGSA_UI_marker0_name setMarkerBrushLocal "FDiagonal";
        A3A_NGSA_UI_marker0_name setMarkerColorLocal "ColorRed";
        A3A_NGSA_UI_marker1_name setMarkerColorLocal "ColorRed";

        if ("mbt0" in A3A_NGSA_depressedKeysHM) then {
            [_worldPos,"shift" in A3A_NGSA_depressedKeysHM, "ctrl" in A3A_NGSA_depressedKeysHM, true] call A3A_fnc_NGSA_click_modeBrush;
            A3A_NGSA_modeBrush_recentDeletion = true;
        } else {
            if !(A3A_NGSA_modeBrush_recentDeletion) exitWith {};
            A3A_NGSA_modeBrush_recentDeletion = false;
            call A3A_fnc_NGSA_action_autoRefresh;
        };
    };
    default {
        private _roadColour = ["ColorOrange","ColorYellow","ColorGreen"] # A3A_NGSA_modeConnect_roadTypeEnum;
        A3A_NGSA_UI_marker0_name setMarkerBrushLocal "Cross";
        A3A_NGSA_UI_marker0_name setMarkerColorLocal _roadColour;
        A3A_NGSA_UI_marker1_name setMarkerColorLocal "ColorBlack";

        if ("mbt0" in A3A_NGSA_depressedKeysHM) then {
            [_worldPos,"shift" in A3A_NGSA_depressedKeysHM, "ctrl" in A3A_NGSA_depressedKeysHM, false] call A3A_fnc_NGSA_click_modeBrush;
        };
    };
};
A3A_NGSA_UI_marker0_name setMarkerPos _worldPos; // Broadcasts marker attributes here
A3A_NGSA_UI_marker1_name setMarkerPos _worldPos; // Broadcasts marker attributes here
