private ["_allMarker", "_placementMarker", "_split", "_start", "_data"];

_allMarker = allMapMarkers;
_placementMarker = [];

airportsX = [];
spawnPoints = [];
resourcesX = [];
factories = [];
outposts = [];
seaports = [];
controlsX = [];
seaMarkers = [];
seaSpawn = [];
seaAttackSpawn = [];
detectionAreas = [];
islands = [];

fnc_sortPlacementMarker =
{
  params ["_array", "_split"];
  private ["_type", "_number", "_start", "_index", "_name"];

  //Calculating linked main marker
  _type = "";
  switch (_split select 0) do
  {
    case ("airp"): {_type = "airport";};
    case ("outp"): {_type = "outpost";};
    case ("reso"): {_type = "resource";};
    case ("fact"): {_type = "factory";};
    case ("seap"): {_type = "seaport";};
  };

  _number = parseNumber (_split select 1);
  _start = 1;
  if(_number != 0) then
  {
    //There is no outpost_0 or something
    _start = 2;
    _type = format ["%1_%2", _type, _number];
  };

  //Build name
  _name = _split select _start;
  for "_i" from (_start + 1) to ((count _split) - 1) do
  {
    _name = format ["%1_%2", _name, _split select _i];
  };

  //Seting connection
  _index = _array findIf {(_x select 0) == _type};
  if(_index == -1) then
  {
    _array pushBack [_type, [_name]];
  }
  else
  {
    ((_array select _index) select 1) pushBack _name;
  };
};

{
  _split = _x splitString "_";
  _start = _split select 0;
  switch (_start) do
  {
    //Detect main marker
    case ("airport"): {airportsX pushBack _x;};
    case ("spawnPoint"): {spawnPoints pushBack _x;};
    case ("resource"): {resourcesX pushBack _x;};
    case ("factory"): {factories pushBack _x;};
    case ("outpost"): {outposts pushBack _x;};
    case ("seaport"): {seaports pushBack _x;};
    case ("control"): {controlsX pushBack _x;};
    case ("seaPatrol"): {seaMarkers pushBack _x;};
    case ("seaSpawn"): {seaSpawn pushBack _x;};
    case ("seaAttackSpawn"): {seaAttackSpawn pushBack _x;};
    case ("detectPlayer"): {detectionAreas pushBack _x;};
    case ("island"): {islands pushBack _x;};

    //Following marker are handled elsewhere
    case ("road");
    case ("respawn");
    case ("DummyUPSMONMarker");
    case ("NATO");
    case ("CSAT");
    case ("Synd"): {};

    //Detect placement marker
    case ("airp");
    case ("reso");
    case ("fact");
    case ("outp");
    case ("seap"): {[_placementMarker, _split] call fnc_sortPlacementMarker;};

    default
    {
      diag_log format ["ERROR: Could not resolve marker %1", _x];
    };
  };
} forEach _allMarker;

//diag_log "Marker setup done, placement marker are";
//[_placementMarker, "Placements"] call A3A_fnc_logArray;

{
    [_x select 0, _x select 1] spawn A3A_fnc_initSpawnPlaces;
} forEach _placementMarker;
