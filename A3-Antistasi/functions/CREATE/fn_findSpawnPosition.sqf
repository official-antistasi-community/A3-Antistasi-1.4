#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
#define VEH               0
#define HELI              1
#define PLANE             2
#define MORTAR            3

params ["_marker", "_type"];

_result = getMarkerPos _marker;

//Debug_2("Searching spawn position on %1 for %2", _marker, _type);
_spawns = spawner getVariable [format ["%1_spawns", _marker], -1];
if(_spawns isEqualType -1) exitWith
{
  Error_1("%1 does not have any spawn positions set!", _marker);
  -1;
};
//DebugArray("Spawnpoints", _spawns);

_selection = -1;
switch (_type) do
{
  case ("Group") :
  {
    //Not yet implemented
  };
  case ("Crew"):
  {
    //Not yet implemented
  };
  case ("Vehicle"):
  {
    _selection = VEH;
  };
  case ("Heli"):
  {
    _selection = HELI;
  };
  case ("Plane"):
  {
    _selection = PLANE;
  };
  case ("Mortar"):
  {
    _selection = MORTAR;
  };
};

if (_selection == -1) exitWith {};

_possible = (_spawns select _selection) select {!(_x select 1)};

if(count _possible > 0) then
{
  _result = selectRandom _possible;
  _index = (_spawns select _selection) findIf {_x isEqualTo _result};
  //Debug_2("Result is %1, Index is %2", _result, _index);
  ((_spawns select _selection) select _index) set [1, true];

  _result = _result select 0;

}
else
{
  _result = -1;
};

Debug_1("Result is %1", _result);
_result;


/*params ["_marker", "_vehicleType"];

private ["_pos", "_spawnPos", "_spawnDir", "_result"];

_pos = getMarkerPos _marker;

_spawnPos = [];
_spawnDir = 0;

switch (true) do
{
  case (_vehicleType isKindOf "Plane"):
  {
    //Find a runway or a hangar
  };
  case (_vehicleType isKindOf "Helicopter"):
  {
    //Find a heli pad
  };
  case (_vehicleType isKindOf "StaticWeapon"):
  {
    //Find a position for in a bunker or a open space for a mortar
  };
  case (_vehicleType isKindOf "Man"):
  {
    //Find a building to spawn in
  };
  default
  {
    //Find a good place near a road or something

    //Debug option to get it working
    _spawnPos = _pos;
  };
};

_result = [_spawnPos, _spawnDir];

_result;
*/
