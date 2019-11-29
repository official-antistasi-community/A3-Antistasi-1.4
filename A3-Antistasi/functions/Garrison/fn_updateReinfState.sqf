params ["_marker"];

/*  Updates the reinf state if the marker, decides whether it can reinforce others and/or needs reinforcement
*   Params:
*     _marker: STRING : The name of the marker
*
*   Returns:
*     Nothing
*/

private ["_ratio", "_side", "_reinfMarker", "_canReinf", "_index", "_isAirport", "_isOutpost"];

_ratio = [_marker] call A3A_fnc_getGarrisonRatio;
_side = sidesX getVariable [_marker, sideUnknown];

if(_side == teamPlayer) exitWith
{
  private _index = reinforceMarkerOccupants findIf {(_x select 1) == _marker};
  if(_index == -1) then
  {
    _index = reinforceMarkerInvader findIf {(_x select 1) == _marker};
    if(_index != -1) then
    {
      reinforceMarkerInvader deleteAt _index;
    };
  }
  else
  {
    reinforceMarkerOccupants deleteAt _index;
  };
  canReinforceOccupants = canReinforceOccupants - [_marker];
  canReinforceInvader = canReinforceInvader - [_marker];
};

//diag_log format ["Marker %1 has a ratio of %2", _marker, _ratio];

_reinfMarker = if(_side == Occupants) then {reinforceMarkerOccupants} else {reinforceMarkerInvader};
_canReinf = if(_side == Occupants) then {canReinforceOccupants} else {canReinforceInvader};

_isAirport = _marker in airportsX;

_index = _reinfMarker findIf {(_x select 1) == _marker};
if(_ratio != 1 && {!_isAirport}) then
{
  //TODO calculate importance of target
  if(_index == -1) then
  {
    //Marker not in _reinfMarker
    _reinfMarker pushBack [_ratio, _marker];
  }
  else
  {
    //Marker in it, replace
    _reinfMarker set [_index, [_ratio, _marker]];
  };
}
else
{
  if(_index != -1) then
  {
    //Delete marker
    _reinfMarker deleteAt _index;
  };
};

_isOutpost = _marker in outposts;
//In desperate need of reinforcements, can't send own
if((_isAirport && _ratio <= 0.4) || {_isOutpost && _ratio <= 0.8}) then
{
  _canReinf = _canReinf - [_marker];
}
else
{
  if(_isAirport || {_isOutpost}) then
  {
    _canReinf pushBackUnique _marker;
  };
};
