params ["_marker"];

/* Unlocks all locked vehicle slots of a marker
*****/

_spawns = spawner getVariable (format ["%1_spawns", _marker]);

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
