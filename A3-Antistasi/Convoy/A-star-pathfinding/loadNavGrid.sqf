[] spawn
{
  _deltaTime = time;
  _abort = false;
  mainMarker = [];

  _worldName = worldName;
  _firstLetter = _worldName select [0,1];
  _remaining = _worldName select [1];
  _firstLetter = toUpper _firstLetter;
  _remaining = toLower _remaining;
  _worldName = format ["%1%2", _firstLetter, _remaining];

  _path = format ["NavGrids\navGrid%1.sqf", _worldName];

  try
  {
    //Load in the nav grid array
    [] call compile preprocessFileLineNumbers _path;
  }
  catch
  {
    //Stop launch of mission, road database is missing
    diag_log format ["Road database could not be loaded, there is no file called\n %1\n\n Aborting mission start!", _path];
    _abort = true;
  };

  roadDataDone = true;
  publicVariable "roadDataDone";

  if(_abort) exitWith {};

  _worldSize = worldSize;
  _chunkSize = 1000; //1000 meters per marker
  _offset = _chunkSize / 2;

  _markerNeeded =  floor (_worldSize / _chunkSize) + 1;

  //hint format ["Marker per side %1, all %2", _markerNeeded, (_markerNeeded * _markerNeeded)];

  {
      _navPointData = _x;
      _index = _navPointData select 0;
      _position = _navPointData select 1;
      _mainMarkers = [_position] call A3A_fnc_getMainMarkers;
      {
          [_index, _x] call A3A_fnc_setNavOnMarker;
      } forEach _mainMarkers;

  } forEach navGrid;

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

  _deltaTime = time - _deltaTime;
  hint format ["Nav grid load and prepared in %1 seconds", _deltaTime];
};
