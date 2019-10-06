//Gets the runway associated with a marker, if it exists.

params ["_marker"];

private _markerPos = getMarkerPos _marker;
private _runways = call A3A_fnc_runwayInfo;

//This is a fairly arbitrary number, but usually, the airport marker is the closest thing to the runway in 700m.
//The only case where this might fuck up is if it's called on some the weird airports which have bases in them near the ends of the runway.
//They might actually falsely claim to have a runway.
//SO DO NOT USE THIS FUNCTION TO CHECK IF SOMETHING HAS A RUNWAY.
private _min = 490000;
private _return = [];
{
	private _distance = (_x select 0) distanceSqr _markerPos;
	if (_distance < _min) then {
		_min = _distance;
		_return = _x;
	};
} forEach _runways;

_return;