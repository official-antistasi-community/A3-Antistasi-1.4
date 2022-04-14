params ["_marker"];

private _result = 0;
private _size = getMarkerSize _marker;

if(markerShape _marker == "ELLIPSE") then {
	_result = PI * (_size select 0) * (_size select 1);
};

if(markerShape _marker == "RECTANGLE") then {
  	_result = (_size select 0) * (_size select 1) * 4;
};

_result;
