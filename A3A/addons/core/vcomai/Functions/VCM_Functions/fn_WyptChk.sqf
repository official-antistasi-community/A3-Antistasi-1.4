
/*
	Author: Genesis

	Description:
		This will tell our scripts if certain waypoints are set or not

	Parameter(s):
		0: GROUP

	Returns:
		ARRAY
*/

_grp = _this;

_waypointsToIncriminate = [];

_index = currentWaypoint _grp;
_waypointIs = waypointType [_grp,_index];
{
	if (_waypointIs isEqualTo _x) then {_waypointsToIncriminate pushback _x};
} foreach ["HOLD","GUARD","UNLOAD","LOAD","TR UNLOAD","SENTRY","DESTROY"];



_waypointsToIncriminate

