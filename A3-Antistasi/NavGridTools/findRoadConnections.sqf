params ["_currentRoad"];
private ["_connected", "_relPos", "_road"];
//Get all connected
_connected = roadsConnectedTo _currentRoad;



for "_i" from 0 to 72 do
{
  _relPos = _currentRoad getRelPos [5, 5 * _i];
  _road = roadAt _relPos;
  if(!(isNull _road) && {_road != _currentRoad}) then
  {
    _connected pushBackUnique _road;
  };
  _relPos = _currentRoad getRelPos [7, (5 * _i) + (5 / 3)];
  _road = roadAt _relPos;
  if(!(isNull _road) && {_road != _currentRoad}) then
  {
    _connected pushBackUnique _road;
  };
  _relPos = _currentRoad getRelPos [10, (5 * _i) + ( 2 * 5 / 3)];
  _road = roadAt _relPos;
  if(!(isNull _road) && {_road != _currentRoad}) then
  {
    _connected pushBackUnique _road;
  };
};

_nearRoads = (getPos _currentRoad) nearRoads 12;
{
    if(_x != _currentRoad) then
    {
      _connected pushBackUnique _x;
    };
} forEach _nearRoads;

_connected;
