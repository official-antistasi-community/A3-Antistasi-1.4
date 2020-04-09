#define MAIN_ROAD 1;
#define ROAD 2;
#define TRACK 3;
#define CITY 4;

_lowerWorldName = toLower worldName;
_path = "";

//Some world does not follow the standard path, list this special worlds here
switch (_lowerWorldName) do
{
    case ("tanoa"):
    {
        _path = "A3\map_tanoabuka\data\roads\roadslib.cfg";
    };
    default {
        _path = format ["A3\map_%1\data\roads\roadslib.cfg", _lowerWorldName];
    };
};

_abort = false;
_content = "";
try
{
  _content = loadFile _path;
}
catch
{
  ["Roads Lib", "Error while loading the roadslib!"] call A3A_fnc_customHint;
  _abort = true;
};

if(_abort) exitWith {false};

_index = _content find "{";
_contentString = _content select [_index + 1];

_debugString = "";
_searchString = "";
_index = 0;
_endIndex = 0;
_nextClass = _contentString find "class";
while {_nextClass != -1} do
{
  //Get the road class number
  _nextRoad = _contentString find "Road";
  _numberStart = _nextRoad + 4;
  //hint _contentString select [_numberStart, 10]);
  private _number = parseNumber (_contentString select [_numberStart, 10]); //Ten to be sure, number should be over before

  //Get the road class type
  _index = _contentString find "{";
  _endIndex = _contentString find "}";
  _searchString = _contentString select [_index, _endIndex - _index];
  private _roadType = CITY;
  if((_searchString find "main road") != -1) then
  {
    _roadType = MAIN_ROAD;
  }
  else
  {
    if((_searchString find "track") != -1) then
    {
      _roadType = TRACK;
    }
    else
    {
      _roadType = ROAD;
    };
  };
  missionNamespace setVariable [format ["type_%1", _number], _roadType];

  //Set debug string
  _debugString = format ["%1Set road class %2 to type %3<br/>",_debugString, _number, _roadType];

  //Cut class out of string
  _contentString = _contentString select [_endIndex + 1];
  _nextClass = _contentString find "class";
};

["Roads Lib", _debugString] call A3A_fnc_customHint;
sleep 15;

true;
