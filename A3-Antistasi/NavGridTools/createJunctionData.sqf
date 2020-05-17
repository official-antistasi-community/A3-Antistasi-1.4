params ["_lastSegment", "_entryPoint"];

//_ignoredSegments = [];
_ignoredSegments = [];
if(!(isNil "_lastSegment") && {!(isNull _lastSegment)}) then
{
  _ignoredSegments pushBack _lastSegment;
};

_segmentsToSearch = [_entryPoint];
_exitPoints = [];
_exits = [];
private _links = [];
//private _debugCounter = 0;

while {count _segmentsToSearch > 0} do
{
    //_debugCounter = _debugCounter + 1;
    _currentRoad = _segmentsToSearch deleteAt 0;
    _connections = [_currentRoad] call findConnection;

    _connections = _connections select {(_x != _entryPoint) && {!(_x in _ignoredSegments) && {!(_x in _exits) && {!(_x in ignoredSegments)}}}};
    _connectionCount = count _connections;

    if(_connectionCount == 1) then
    {
      if((_connections select 0) in linkSegments) then
      {
        _links pushBack (_connections select 0);
        _ignoredSegments pushBack (_connections select 0);
        _ignoredSegments pushBack _currentRoad;
      }
      else
      {
        _exitPoints pushBackUnique [_connections select 0, _currentRoad];
        _exits pushBackUnique _currentRoad;
      };
    }
    else
    {
      _ignoredSegments pushBack _currentRoad;
      {
        if(_x in linkSegments) then
        {
          _links pushBack _x;
          _ignoredSegments pushBack _x;
        }
        else
        {
          if(!(_x in _exits)) then
          {
            _segmentsToSearch pushBackUnique _x;
          };
        };
      } forEach _connections;
    };
};

//sleep 1;



if(!(isNil "_lastSegment") && {!(isNull _lastSegment)}) then
{
  _ignoredSegments = _ignoredSegments - [_lastSegment];
};

_midOfJunction = [0,0,0];
_exitCount = 0;
if(!(isNil "_lastSegment") && {!(isNull _lastSegment)}) then
{
  _midOfJunction = (getPos _lastSegment);
  _exitCount = 1;
};

{
    _midOfJunction = _midOfJunction vectorAdd (getPos _x);
    _exitCount = _exitCount + 1;
} forEach _links;

_exitPointsCopy = [];
{
  _road = (_x select 1);
  _connections = [_road] call findConnection;
  _connections = _connections select {!(_x in _exits) && {!(_x in _ignoredSegments)}};
  if(count _connections > 0) then
  {
    _exitPointsCopy pushBack _x;
    _midOfJunction = _midOfJunction vectorAdd (getPos _road);
    _exitCount = _exitCount + 1;
  }
  else
  {
    _ignoredSegments pushBack _road;
  };
} forEach _exitPoints;

_exitPoints = _exitPointsCopy;


_result = [];
if(_exitCount > 0) then
{
  _midOfJunction = _midOfJunction vectorMultiply (1 / _exitCount);
  _midSegment = objNull;
  _searchRadius = 0;
  while {isNull _midSegment} do
  {
    _searchRadius = _searchRadius + 1;
    _nearRoads = _midOfJunction nearRoads _searchRadius;
    if(count _nearRoads > 0) then
    {
      {
        if(!(_x in _exits)) then
        {
          _midSegment = _x;
        };
      } forEach _nearRoads;
    };
  };
  _result = [_exitPoints, _midOfJunction, _ignoredSegments, _midSegment, _links];
};

//hint format ["Entry point was %1<br/>Last was %2<br/>Results are %3", _entryPoint, _lastSegment, str _exitPoints];
//sleep 15;

_result;
