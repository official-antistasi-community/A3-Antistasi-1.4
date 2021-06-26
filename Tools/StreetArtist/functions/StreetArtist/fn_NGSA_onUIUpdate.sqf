/*
Maintainer: Caleb Serafin
    Called by event handler
    Calls specific modes.

Return Value:
    <ANY> nil.

Scope: Client, Local Arguments, Global Effect
Environment: Unscheduled
Public: No

Dependencies:
    <SCALAR> A3A_NGSA_clickModeEnum Currently select click mode

Example:
    private _missionEH_eachFrame_ID = addMissionEventHandler ["EachFrame", {
        call A3A_fnc_NGSA_onUIUpdate;
    }];
*/
if (!visibleMap) exitWith {};

private _mousePos = getMousePosition;
private _mapTexture = findDisplay 12 displayCtrl 51;
private _worldPos = [_mapTexture ctrlMapScreenToWorld _mousePos] call A3A_fnc_NGSA_getSurfaceATL;
private _mapScale = ctrlMapScale _mapTexture;
private _fullSelectionRadius = worldSize / 16 * _mapScale;
A3A_NGSA_maxSelectionRadius = _fullSelectionRadius min 150;         // Note, due to 100m edge map regions, the max distance will be between 100m and 282.8m.

A3A_NGSA_modeConnect_lineName setMarkerAlphaLocal 0;

switch (A3A_NGSA_clickModeEnum) do {
    case 0: {       // Connections
        [_worldPos] call A3A_fnc_NGSA_hover_modeConnect;
    };
    case 1: {       // Brush Node Deletion/Connection Types
        [_worldPos] call A3A_fnc_NGSA_hover_modeBrush;
    };
    case 2: {       // Toggle Render region
        // Soon™
    };
    default {
        throw ["IndexOutOfBounds","A3A_NGSA_clickModeEnum must be between 0 and 2 inclusively."];
    };
};

A3A_NGSA_toolModeChanged = false;
nil;
