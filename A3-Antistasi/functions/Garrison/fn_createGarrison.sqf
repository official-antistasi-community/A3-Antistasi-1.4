params ["_markerArray", "_type", ["_lose", [0, 0, 0]]];

/*  Creates the initial garrison for a set a marker of a specific type
*   Params:
*     _markerArray : ARRAY of MARKER : The set of marker
*     _type : STRING : The type of the marker, one of Airport, Outpost, City or Other
*     _losses : ARRAY of NUMBERS : The amount of lines that should be requested by the marker instead of already there [LAND, HELI, AIR] (default [0,0,0])
*
*   Returns:
*     Nothing
*/

private ["_losses", "_preferred", "_garrison", "_requested", "_marker", "_side", "_line", "_start", "_index"];

_preferred = garrison getVariable [format ["%1_preference", _type], objNull];
while {!(_preferred isEqualType [])} do
{
  diag_log format ["CreateGarrison: Preference %1_preference not set yet, waiting for 1 second", _type];
  sleep 1;
  _preferred = garrison getVariable [format ["%1_preference", _type], objNull];
};
{
  _losses = +_lose;
  _garrison = [];
  _requested = [];
  _marker = _x;
  _side = sidesX getVariable [_marker, sideUnknown];
  while {_side == sideUnknown} do
  {
    diag_log format ["Side unknown for %1, sleeping 1!", _marker];
    sleep 1;
    _side = sidesX getVariable [_marker, sideUnknown];
  };
  for "_i" from 0 to ((count _preferred) - 1) do
  {
    _line = [_preferred select _i, _side] call A3A_fnc_createGarrisonLine;

    _start = ((_preferred select _i) select 0) select [0,3];
    _index = ["LAN", "HEL", "AIR"] findIf {_x == _start};
    //diag_log format ["Start %1 Index %2 Preference %3", _start, _index, str (_preferred select _i)];
    if(_index == -1 || {(_losses select _index) <= 0}) then
    {
      //TODO init arrays with specific size to avoid resize operations
      _garrison pushBack _line;
      _requested pushBack ["", [], []];
    }
    else
    {
      _losses set [_index, (_losses select _index) - 1];
      _garrison pushBack ["", [], []];
      _requested pushBack _line;
    };
  };
  garrison setVariable [format ["%1_garrison", _marker], _garrison, true];
  garrison setVariable [format ["%1_requested", _marker], _requested, true];

  if(debug) then
  {
    diag_log format ["Garrison on %1 is now set", _marker];
    [_garrison, format ["%1_garrison", _marker]] call A3A_fnc_logArray;
  };

  [_marker] call A3A_fnc_updateReinfState;
} forEach _markerArray;
