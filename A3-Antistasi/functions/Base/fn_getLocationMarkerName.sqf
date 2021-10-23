// TODO UI-update: add proper header
// Get display name of a location marker

#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params [["_marker", ""]];

if (_marker isEqualTo "") exitWith {Error("No marker specified")};

private _markerType = [_marker] call A3A_fnc_getLocationMarkerType;
private _markerName = switch (_markerType) do {
    case ("hq"): {
        "HQ";
    };

    case ("city"): {
        private _location = nearestLocations [getMarkerPos _marker, ["NameCityCapital", "NameCity", "NameVillage", "CityCenter"], 100] # 0;
        text _location;
    };

    case ("factory"): {
        "Factory";
    };

    case ("resource"): {
        "Resource";
    };

    case ("seaport"): {
        "Seaport";
    };

    case ("airport"): {
        "Airport";
    };

    case ("outpost"): {
        "Outpost";
    };

    case ("watchpost"): {
        "Watchpost";
    };

    case ("roadblock"): {
        "Roadblock";
    };

    default {
        "UNSUPPORTED MARKER TYPE";
    };
};

_markerName;
