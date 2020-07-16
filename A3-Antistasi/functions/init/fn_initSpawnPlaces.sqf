#define SPACING     1

params ["_marker", "_placementMarker"];

private ["_vehicleMarker", "_heliMarker", "_hangarMarker", "_mortarMarker", "_markerPrefix", "_markerSplit", "_first", "_fullName"];

_vehicleMarker = [];
_heliMarker = [];
_hangarMarker = [];
_mortarMarker = [];

//Calculating marker prefix
_markerPrefix = "";
_markerSplit = _marker splitString "_";
switch (_markerSplit select 0) do
{
  case ("airport"): {_markerPrefix = "airp_";};
  case ("outpost"): {_markerPrefix = "outp_";};
  case ("resource"): {_markerPrefix = "reso_";};
  case ("factory"): {_markerPrefix = "fact_";};
  case ("seaport"): {_markerPrefix = "seap_";};
};
if(count _markerSplit > 1) then
{
  _markerPrefix = format ["%1%2_", _markerPrefix, _markerSplit select 1];
};

//Sort marker
_mainMarker = getMarkerPos _marker;
{
  _first = (_x splitString "_") select 0;
  _fullName = format ["%1%2", _markerPrefix, _x];
  if(debug && {_mainMarker distance (getMarkerPos _fullName) > 500}) then
  {
    diag_log format ["Placementmarker %1 is more than 500 meter away from its mainMarker %2. You may want to check that!", _fullName, _marker];
  };
  switch (_first) do
  {
    case ("vehicle"): {_vehicleMarker pushBack _fullName;};
    case ("helipad"): {_heliMarker pushBack _fullName;};
    case ("hangar"): {_hangarMarker pushBack _fullName;};
    case ("mortar"): {_mortarMarker pushBack _fullName;};
  };
  _fullName setMarkerAlpha 0;
} forEach _placementMarker;

if(count _vehicleMarker == 0) then
{
  diag_log format ["InitSpawnPlaces: Could not find any vehicle places on %1!", _marker];
};

private ["_markerSize", "_distance", "_buildings", "_hangars", "_helipads", "_markerX"];

_markerSize = markerSize _marker;
_distance = sqrt ((_markerSize select 0) * (_markerSize select 0) + (_markerSize select 1) * (_markerSize select 1));

_buildings = nearestObjects [getMarkerPos _marker, ["Helipad_Base_F", "Land_Hangar_F", "Land_TentHangar_V1_F", "Land_Airport_01_hangar_F", "Land_Mil_hangar_EP1", "Land_Ss_hangar", "Land_Ss_hangard"], _distance, true];

_hangars = [];
_helipads = [];

{
  if((getPos _x) inArea _marker) then
  {
    if(_x isKindOf "Helipad_Base_F") then
    {
      _helipads pushBack _x;
    }
    else
    {
      _hangars pushBack _x;
    };
  };
} forEach _buildings;

//Find additional helipads and hangars (maybe a unified system would be better??)
{
  _markerX = _x;
  _markerSize = markerSize _x;
  _distance = sqrt ((_markerSize select 0) * (_markerSize select 0) + (_markerSize select 1) * (_markerSize select 1));
  _buildings = nearestObjects [getMarkerPos _x, ["Helipad_Base_F"], _distance, true];
  {
    if((getPos _x) inArea _markerX) then
    {
      _helipads pushBackUnique _x;
    };
  } forEach _buildings;
} forEach _heliMarker;

{
  _markerX = _x;
  _markerSize = markerSize _x;
  _distance = sqrt ((_markerSize select 0) * (_markerSize select 0) + (_markerSize select 1) * (_markerSize select 1));
  _buildings = nearestObjects [getMarkerPos _x, ["Land_Hangar_F", "Land_TentHangar_V1_F", "Land_Airport_01_hangar_F", "Land_Mil_hangar_EP1", "Land_Ss_hangar", "Land_Ss_hangard"], _distance, true];
  {
    if((getPos _x) inArea _markerX) then
    {
      _hangars pushBackUnique _x;
    };
  } forEach _buildings;
} forEach _hangarMarker;
//All additional hangar and helipads found

private ["_vehicleSpawns", "_size", "_length", "_width", "_vehicleCount", "_realLength", "_realSpace", "_markerDir", "_dis", "_pos", "_heliSpawns", "_dir", "_planeSpawns", "_mortarSpawns", "_spawns"];

_vehicleSpawns = [];
{
    _markerX = _x;
    _size = getMarkerSize _x;
    _length = (_size select 0) * 2;
    _width = (_size select 1) * 2;
    if(_width < (4 + 2 * SPACING)) then
    {
      diag_log format ["InitSpawnPlaces: Marker %1 is not wide enough for vehicles, required are %2 meters!", _x , (4 + 2 * SPACING)];
    }
    else
    {
      if(_length < 10) then
      {
          diag_log format ["InitSpawnPlaces: Marker %1 is not long enough for vehicles, required are 10 meters!", _x];
      }
      else
      {
        //Cleaning area
        private _radius = sqrt (_length * _length + _width * _width);
        if (!isMultiplayer) then
        {
          {
            if((getPos _x) inArea _markerX) then
            {
              _x hideObject true;
            };
          } foreach (nearestTerrainObjects [getMarkerPos _markerX, ["Tree","Bush", "Hide", "Rock", "Fence"], _radius, true]);
        }
        else
        {
          {
            if((getPos _x) inArea _markerX) then
            {
              [_x,true] remoteExec ["hideObjectGlobal",2];
            }
          } foreach (nearestTerrainObjects [getMarkerPos _markerX, ["Tree","Bush", "Hide", "Rock", "Fence"], _radius, true]);
        };

        //Create the places
        _vehicleCount = floor ((_length - SPACING) / (4 + SPACING));
        _realLength = _vehicleCount * 4;
        _realSpace = (_length - _realLength) / (_vehicleCount + 1);
        _markerDir = markerDir _markerX;
        for "_i" from 1 to _vehicleCount do
        {
          _dis = (_realSpace + 2 + ((_i - 1) * (4 + _realSpace))) - (_length / 2);
          _pos = [getMarkerPos _markerX, _dis, (_markerDir + 90)] call BIS_fnc_relPos;
          _pos set [2, ((_pos select 2) + 0.1) max 0.1];
          _vehicleSpawns pushBack [[_pos, _markerDir], false];
        };
      };
    };
} forEach _vehicleMarker;

_heliSpawns = [];
{
    _pos = getPos _x;
    _pos set [2, 0.1];
    if (!isMultiplayer) then
    {
      {
        _x hideObject true;
      } foreach (nearestTerrainObjects [_pos, ["Tree","Bush", "Hide", "Rock"], 5, true]);
    }
    else
    {
      {
        [_x,true] remoteExec ["hideObjectGlobal",2];
      } foreach (nearestTerrainObjects [_pos, ["Tree","Bush", "Hide", "Rock"], 5, true]);
    };
    _dir = direction _x;
    _heliSpawns pushBack [[_pos, _dir], false];
} forEach _helipads;

_planeSpawns = [];
{
    _pos = getPos _x;
    _pos set [2, ((_pos select 2) + 0.1) max 0.1];
    _dir = direction _x;
    if(_x isKindOf "Land_Hangar_F" || {_x isKindOf "Land_Airport_01_hangar_F" || {_x isKindOf "Land_Mil_hangar_EP1" || {_x isKindOf "Land_Ss_hangar" || {_x isKindOf "Land_Ss_hangard"}}}}) then
    {
      //This hangar is facing the wrong way...
      _dir = _dir + 180;
    };
    _planeSpawns pushBack [[_pos, _dir], false];
} forEach _hangars;

_mortarSpawns = [];
{
  _pos = getMarkerPos _x;
  _pos set [2, ((_pos select 2) + 0.1) max 0.1];
  _mortarSpawns pushBack [[_pos, 0], false];
} forEach _mortarMarker;

_spawns = [_vehicleSpawns, _heliSpawns, _planeSpawns, _mortarSpawns];

//diag_log format ["%1 set to %2", _marker, _spawns];

//Saving the spawn places
spawner setVariable [format ["%1_spawns", _marker], _spawns, true];
