// TODO UI-update: add proper header
// Get time to travel to destination

#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params [["_group", grpNull],["_marker", ""]];

// Error checking
if (_marker isEqualTo "") exitWith {Error("No marker specified")};
if (isNull _group) exitWith {Error("No group specified")};

private _positionX = [getMarkerPos _marker, 10, random 360] call BIS_Fnc_relPos;
private _fastTravelTime = round (((position leader _group) distance _positionX)/200);
_fastTravelTime;
