#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _roadblocks = controlsX findIf { isOnRoad getMarkerPos _x };
private _possibleMarkers = [outposts + resourcesX + factories + seaports + _roadblocks] call FUNC(nearHostileMarkers);

if (_possibleMarkers isEqualTo []) exitWith {false};
_possibleMarkers;