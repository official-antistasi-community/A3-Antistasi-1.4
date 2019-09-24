params ["_navPointIndex", "_markerName"];

_navPoints = missionNamespace getVariable [(format ["%1_data", _markerName]), []];
_navPoints pushBack _navPointIndex;
missionNamespace setVariable [(format ["%1_data", _markerName]), _navPoints];
