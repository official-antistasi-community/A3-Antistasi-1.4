params ["_type", "_pos", "_color"];

_marker = createMarker [format ["%1road%2", random 10000, random 10000], _pos];
_marker setMarkerShape "ICON";
_marker setMarkerType _type;
_marker setMarkerColor _color;
_marker setMarkerAlpha 1;

allMarker pushBack _marker;

_marker;
