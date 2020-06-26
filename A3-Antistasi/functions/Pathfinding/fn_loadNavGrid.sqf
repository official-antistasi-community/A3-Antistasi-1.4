private _filename = "fn_loadNavGrid";

[2, "Started loading nav grid", _filename] call A3A_fnc_log;

private _firstLetter = toUpper (worldName select [0,1]);
private _remaining = toLower (worldName select [1]);
private _path = format ["Navigation\navGrid%1%2.sqf", _firstLetter, _remaining];

private _abort = false;
try
{
	//Load in the nav grid array
	[] call compile preprocessFileLineNumbers _path;
}
catch
{
	[1, format ["Road database at %1 could not be loaded", _path], _filename] call A3A_fnc_log;
	_abort = true;
};
if(_abort) exitWith {};

{
	private _navPointData = _x;
	private _index = _navPointData select 0;
	private _position = _navPointData select 1;
	private _mainMarkers = [_position] call A3A_fnc_getMainMarkers;
	{
		[_index, _x] call A3A_fnc_setNavOnMarker;
	} forEach _mainMarkers;
} forEach navGrid;

roadDataDone = true;

[2, "Finished loading nav grid", _filename] call A3A_fnc_log;


/*
// Left this code here in case someone needs it for debugging
mainMarker = [];

private _chunkSize = 1000; //1000 meters per marker
private _markerNeeded =  floor (worldSize / _chunkSize) + 1;

for "_i" from 0 to (_markerNeeded - 1) do
{
	for "_j" from 0 to (_markerNeeded - 1) do
	{
		_markerPos = [_offset + _i * _chunkSize, _offset + _j * _chunkSize];
		_marker = createMarker [format ["%1/%2", _i, _j], _markerPos];
		_marker setMarkerShape "ICON";
		_marker setMarkerType "mil_circle";
		_marker setMarkerColor "ColorBlack";
		_points = missionNamespace getVariable [(format ["%1/%2_data", _i, _j]), []];
		_marker setMarkerText (format ["%1/%2, NavPoints: %3", _i, _j, count _points]);
		_marker setMarkerAlpha 0;
		
		mainMarker pushBack "_marker";
	};
};
*/
