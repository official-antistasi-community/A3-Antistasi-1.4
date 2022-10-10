/*
    Handles the initialization and tab switching on the setup dialog.
    This function should only be called from setupDialog onLoad and control activation EHs.

Environment: Scheduled for onLoad mode / Unscheduled for everything else unless specified

Arguments:
    <STRING> Mode, e.g. "onLoad", "switchTab"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mode", "_params"];

Debug_1("HQ pos dialog called with mode %1", _mode);

private _display = findDisplay A3A_IDD_SETUPHQPOSDIALOG;
private _parent = displayParent _display;

switch (_mode) do
{
    case ("onLoad"):
    {
        // Draw hatched danger zones
        private _mainMarkers = (markersX - controlsX);
        private _mrkDangerZone = [];
        {
            _mrk = createMarkerLocal [format ["dangerzone%1", count _mrkDangerZone], markerPos _x];
            _mrk setMarkerShapeLocal "ELLIPSE";
            _mrk setMarkerSizeLocal [500,500];
            _mrk setMarkerTypeLocal "hd_warning";
            _mrk setMarkerColorLocal "ColorRed";
            _mrk setMarkerBrushLocal "DiagGrid";
            _mrkDangerZone pushBack _mrk;
        } forEach _mainMarkers;
        _display setVariable ["dangerZones", _mrkDangerZone];
    };

    case ("onUnload"):
    {
        private _mrkDangerZone = _display getVariable "dangerZones";
        { deleteMarkerLocal _x } forEach _mrkDangerZone;
    };

    case ("mouseUp"):
    {
        _params params ["_mapCtrl", "_button", "_xPos", "_yPos"];
        if (_button != 0) exitWith {};          // left mouse button only

        private _posClicked = _mapCtrl posScreenToWorld [_xPos, _yPos];
        private _posInvalid = true;

        private _nearMarker = [markersX - controlsX, _posClicked] call BIS_fnc_nearestPosition;
        if (markerPos _nearMarker distance2d _posClicked < 500) exitWith {
            ["HQ Position", "Selected position cannot be near enemy zones."] call A3A_fnc_customHint;
        };

        if (surfaceIsWater _posClicked) exitWith {
            ["HQ Position", "Selected position cannot be in water."] call A3A_fnc_customHint;
        };

        if (_posClicked findIf { (_x < 0) || (_x > worldSize) } != -1) then {
            ["HQ Position", "Selected position cannot be outside the map."] call A3A_fnc_customHint;
        };

        "Synd_HQ" setMarkerPosLocal _posClicked;
        respawnTeamPlayer setMarkerPosLocal markerPos "Synd_HQ";
    };
};
