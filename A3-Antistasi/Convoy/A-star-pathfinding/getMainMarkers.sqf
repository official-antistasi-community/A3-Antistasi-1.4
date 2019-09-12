#define OFFSET 300

params ["_pos"];

_allMarkers = [];

_x = _pos select 0;
_y = _pos select 1;

_xFloored = floor (_x / 1000);
_yFloored = floor (_y / 1000);

_markerName = format ["%1/%2", _xFloored, _yFloored];
_allMarkers pushBack _markerName;

_xSidePos = floor ((_x + OFFSET)/1000);
_xSideNeg = floor ((_x - OFFSET)/1000);

_xDiff = _xFloored;
_xHasDiff = false;
if(_xSideNeg != _xDiff || _xSidePos != _xDiff) then
{
  _xHasDiff = true;
  if(_xSidePos != _xDiff) then
  {
    _xDiff = _xSidePos;
  }
  else
  {
    _xDiff = _xSideNeg;
  };
  _markerName = format ["%1/%2", _xDiff, _yFloored];
  _allMarkers pushBackUnique _markerName;
};

_ySidePos = floor ((_y + OFFSET)/1000);
_ySideNeg = floor ((_y - OFFSET)/1000);

_yDiff = _yFloored;
_yHasDiff = false;
if(_ySideNeg != _yDiff || _ySidePos != _yDiff) then
{
  _yHasDiff = true;
  if(_ySidePos != _yDiff) then
  {
    _yDiff = _ySidePos;
  }
  else
  {
    _yDiff = _ySideNeg;
  };
  _markerName = format ["%1/%2", _xFloored, _yDiff];
  _allMarkers pushBackUnique _markerName;
};

if(_yHasDiff && _xHasDiff) then
{
  _markerName = format ["%1/%2", _xDiff, _yDiff];
  _allMarkers pushBackUnique _markerName;
};

_allMarkers;
