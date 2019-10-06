params ["_convoyID" ,"_route", "_markerArray", "_maxSpeed", "_units", "_convoySide", "_convoyType", "_isAir", ["_debugObject", nil]];

/*  Simulates the movement of the convoy
*   Params:
*     _convoyID : NUMBER; the unique convoy ID
*     _route : ARRAY; contains the position of the route points
*     _markerArray
*     _maxSpeed : NUMBER; contains the max speed the convoy can move in m/s
*     _units : ARRAY; contains the units and vehicles, will not be used in here, just passed
*     _convoySide : SIDE; contains the side of the convoy
*     _convoyType : STRING; contains one of "ATTACK", "PATROL" or "REINFORCE"
*     _debugObject : OBJECT (optional); object to visualize the convoy travel
*   Returns:
      Nothing
*/

if(isNil "_route") exitWith {diag_log format ["ConvoyMovement[%1]: No route given!", _convoyID]};
if(!(_maxSpeed > 0)) exitWith {diag_log format ["ConvoyMovement[%1]: Max speed is 0 or lower, can't simulate convoy with it!", _convoyID]};

_convoyMarker = format ["convoy%1", _convoyID];
_maxSpeed = _maxSpeed * 0.8; //Only drive with 80% of max speed


_isDebug = !(isNil "_debugObject");

_pointsCount = count _route;
_currentPos = _route select 0;

_isSimulated = true;
_isDestroyed = false;
_roadBlockCountdown = 0;
_currentRoadBlock = "";

if(_isDebug) then {_debugObject setPos _currentPos;};

for "_i" from 1 to (_pointsCount - 1) do
{
  _lastPoint = _route select (_i - 1);
  _nextPoint = _route select (_i);

  _movementVector = (_lastPoint vectorFromTo _nextPoint) vectorMultiply _maxSpeed;
  _movementLength = _lastPoint vectorDistance _nextPoint;
  _currentLength = 0;

  while {_isSimulated && {_currentLength < _movementLength}} do
  {
    sleep 1;
    if(_roadBlockCountdown > 0) then
    {
      _roadBlockCountdown = _roadBlockCountdown - 1;
      if(_roadBlockCountdown <= 0) then
      {
        //Have a fight
        _isSimulated = [_units, _currentRoadBlock] call A3A_fnc_roadblockFight;
        _isDestroyed = !_isSimulated;
      };
    }
    else
    {
      _currentPos = _currentPos vectorAdd _movementVector;
      _currentLength = _currentLength + _maxSpeed;
      if(_currentLength < _movementLength) then
      {
        _convoyMarker setMarkerPos _currentPos;
      };

      if(_isDebug && {_currentLength < _movementLength}) then {_debugObject setPos _currentPos;};

      //Search for nearby roadblocks
      _roadBlocks = outpostsFIA select {(getMarkerPos _x distance _currentPos < 250) && {isOnRoad (getMarkerPos _x)}};
      if(count _roadBlocks > 0) then
      {
        _currentRoadBlock = _roadBlocks select 0;
        if(spawner getVariable _currentRoadBlock == 2) then
        {
          _isSimulated = false;
          private _posArray = [_currentPos, _nextPoint, (_route select (_pointsCount - 1))];
          [_convoyID, _units, _posArray, _markerArray, _convoySide, _convoyType, _maxSpeed] call A3A_fnc_spawnConvoy;
        }
        else
        {
          _roadBlockCountdown = 60;
          if (!([_currentRoadBlock] call BIS_fnc_taskExists)) then
          {
            [_currentRoadBlock, _convoySide, teamPlayer, false] remoteExec ["A3A_fnc_underAttack",2]
          };
        };
      };
    };


    /*
    _nearMarker = markersX select {(sidesX getVariable [_x, sideUnknown] != _convoySide) && {getMarkerPos _x distance _currentPos < 150}};
    if(count _nearMarker > 0) then
    {
      if((_nearMarker select 0) distance _currentPos < 75 || !((_nearMarker select 0) in controlsX)) then
      {
        //Drove into an enemy position, spawn fight
      }
    };
    */

    //Currently only triggered by teamPlayer units!
    if([distanceSPWN, 1, _currentPos, teamPlayer] call A3A_fnc_distanceUnits) then
    {
      _isSimulated = false;

      //deleteMarker _convoyMarker;
      // - 2 as it is the last point on a street (or maybe not needs testing) _currentPos, _nextPoint,
      private _posArray = [_currentPos, _nextPoint, (_route select (_pointsCount - 1))];
      [_convoyID, _units, _posArray, _markerArray, _convoySide, _convoyType, _maxSpeed] call A3A_fnc_spawnConvoy;
    };
  };

  _currentPos = _nextPoint;
  _convoyMarker setMarkerPos _currentPos;
  if(_isDebug) then {_debugObject setPos _currentPos;};
};

if(_isDestroyed) exitWith {deleteMarker _convoyMarker};
if(!_isSimulated) exitWith {};

diag_log format ["ConvoyMovement[%1]: Convoy arrived at destination!", _convoyID];

[_convoyID, (_route select 0), (_route select (_pointsCount - 1)), _units, _convoySide, _convoyType] spawn A3A_fnc_onConvoyArrival;

sleep 10;
deleteMarker _convoyMarker;
