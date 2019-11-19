params ["_marker"];

/* Unlocks all locked vehicle slots of a marker
*****/

_spawns = spawner getVariable [format ["%1_spawns", _marker], [[],[],[],[]]];
if(_spawns isEqualTo [[],[],[],[]]) exitWith
{
  diag_log format ["Marker %1 has no spawn places defined!", _marker];
};

diag_log format ["Logging spawn places of %1", _marker];
[_spawns, "Spawn places"] call A3A_fnc_logArray;

for "_i" from 0 to 3 do
{
  _places = _spawns select _i;
  {
    if(_x select 1) then
    {
      _x set [1, false];
    }
  } forEach _places;
};
