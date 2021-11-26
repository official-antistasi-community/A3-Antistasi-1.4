/*
Maintainer: Caleb Serafin
    Called by event handler
    Calls specific modes.
    Game Modifier keys are unused.
    Instead the global cache is used to limit and control key presses (eg: alt-tabbing while key down will not fire key up).

Arguments:
    <DISPLAY> _display
    <SCALAR> _button
    <SCALAR> _xPos
    <SCALAR> _yPos
    <BOOLEAN> _shift Unused.
    <BOOLEAN> _ctrl Unused.
    <BOOLEAN> _alt Unused.

Return Value:
    <ANY> nil if no action. <BOOLEAN> True if action.

Scope: Client, Local Arguments, Local Effect
Environment: Unscheduled
Public: No

Dependencies:
    <SCALAR> A3A_NGSA_clickModeEnum Currently select click mode

Example:
    findDisplay 12 displayAddEventHandler ["MouseButtonDown", {
        if (!XXX_Slayer_MouseDown) then {
            XXX_Slayer_MouseDown = true;
            _this call A3A_fnc_NGSA_onMouseClick;
        };
    }];
*/
params ["_display", "_button", "_xPos", "_yPos", "_shiftUnused", "_ctrlUnused", "_altUnused"];

if (!visibleMap) exitWith {nil};
private _leftClick = _button isEqualTo 0;   // Will only be left or right
if !(_leftClick) exitWith {nil};

private _shift = "shift" in A3A_NGSA_depressedKeysHM;
private _ctrl = "ctrl" in A3A_NGSA_depressedKeysHM;
private _alt = "alt" in A3A_NGSA_depressedKeysHM;

private _worldPos = [findDisplay 12 displayCtrl 51 ctrlMapScreenToWorld [_xPos, _yPos]] call A3A_fnc_NGSA_getSurfaceATL;

switch (A3A_NGSA_clickModeEnum) do {
    case 0: {       // Connections
        [_worldPos , _shift, _ctrl, _alt] call A3A_fnc_NGSA_click_modeConnect;
    };
    case 1: {       // Node Deletion brush
        // All done in onUIUpdate
        true;
    };
    case 2: {       // Toggle Render region
        // Soon™
        nil;
    };
    default {
        throw ["IndexOutOfBounds","A3A_NGSA_clickModeEnum must be between 0 and 2 inclusively."];
        nil;
    };
};
