params ["_destination", ["_side", sideUnknown]];

/*
*   Usage: Searches for a suitable Airport for an airstrike on given destination
*
*   params
*   _destination : MARKER or POS; the destination of the airstrike
*   _side : SIDE; the side of the airstrike, only needed if _destination is a POS
*
*   retuns
*   _airport : MARKER; the best suited airport, nil if none found
*/
_airport = "";
if(isNil "_destination") exitWith {diag_log "FindAirportForAirstrike: No destination given"; _airport};

//Assuming _destination is a pos
_destinationPos = _destination;

//Given destination is a marker, getting side by marker or given side
if(_destination isEqualType "") then
{
  //Side not given
  if(_side == sideUnknown) then
  {
    _side = sidesX getVariable [_destination, sideUnknown];
  };
  _destinationPos = getMarkerPos _destination;
};

if(_side == sideUnknown) exitWith {diag_log "FindAirportForAirstrike: No side given"; _airport};

//Sort by side
_possibleAirports = airportsX select {sidesX getVariable [_x, sideUnknown] == _side};

//Sort by further criteria
/* //DEACTIVATED FOR DEBUG
_possibleAirports = _possibleAirports select
{
  (spawner getVariable _x == 2) &&                    //Not already spawned in
  {(dateToNumber date > server getVariable _x) &&     //Not currently on cooldown
  {!(_x in forcedSpawn) &&                            //Not force spawned in (not sure how long this will be in the script tho)
  {!(_x in blackListDest) &&                          //Not blacklisted (don't know why? TODO Investigate)
  {(getMarkerPos _x distance _destinationPos > distanceSPWN)}}}} //Not closer than spawn distance
};
*/

//Sort by max distance and killzones (TODO what are killzones and how are they working??)
_suitableAirports = [];
{
  _posbase = getMarkerPos _x;
  if ((_destinationPos distance _posbase < distanceForAirAttack) /*&& (({_x == _markerX} count (killZones getVariable [_x,[]])) < 3)*/) then
  {
    _suitableAirports pushBack _x;
  };
} forEach _possibleAirports;


//If some remain, choose the nearest one, else return nil
if (count _suitableAirports > 0) then
{
  _airport = [_suitableAirports,_destinationPos] call BIS_fnc_nearestPosition;
  diag_log format ["FindAirportForAirstrike: Found %1 suitable airports, will return %2", count _suitableAirports, _airport];
}
else
{
  _airport = "";
  diag_log "FindAirportForAirstrike: No suitable position found, returning empty string";
};
_airport
