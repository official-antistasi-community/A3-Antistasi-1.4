[] call compile preprocessFileLineNumbers "NavGridTools\MapRoadHash\stratisMapRoadHash.sqf";
_allRoads = [];
_allRoads = (getPos player) nearRoads 100000;

_highestFileIndex = 0;
_lowestFileIndex = 999999;

{
    if((_x select 0) > _highestFileIndex) then
    {
      _highestFileIndex = (_x select 0);
    };
    if((_x select 0) < _lowestFileIndex) then
    {
      _lowestFileIndex = (_x select 0);
    };
} forEach roadTypes;

["Find Offset", format ["FileHigh: %1<br/>FileLow: %2", _highestFileIndex, _lowestFileIndex]] call A3A_fnc_customHint;
sleep 5;

_highestStreetIndex = 0;
_lowestStreetIndex = 999999;

waitUntil {sleep 1; (count _allRoads > 0)};

{
  _roadNameFull = str _x;
  _stringArray = _roadNameFull splitString ":";
  _result = _stringArray select 0;

  if(count _result == 6) then
  {
    _result = _result select [0,4];
    _number = parseNumber (_result);

    if(_number > _highestStreetIndex) then
    {
      _highestStreetIndex = _number;
      //hint format ["Full: %3<br/>Res %1<br/>Number: %2", _result, _number, _roadNameFull];
      //sleep 1;
    };
    if(_number < _lowestStreetIndex) then
    {
      _lowestStreetIndex = _number;
      //hint format ["Full: %3<br/>Res %1<br/>Number: %2", _result, _number, _roadNameFull];
      //sleep 1;
    };
  };
} forEach _allRoads;

["Find Offset", format ["StreetHigh: %1<br/>StreetLow: %2", _highestStreetIndex, _lowestStreetIndex]] call A3A_fnc_customHint;
sleep 15;

_difHighest = _highestStreetIndex - _highestFileIndex;
_difLowest = _lowestStreetIndex - _lowestFileIndex;

["Find Offset", format ["High Offset: %1<br/>Low Offset: %2<br/>Equal: %3", _difHighest, _difLowest, str (_difHighest == _difLowest)]] call A3A_fnc_customHint;
