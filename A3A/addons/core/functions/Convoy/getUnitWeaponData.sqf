//This code is not mine, it is copied from https://community.bistudio.com/wiki/weaponsTurret
//I do not claim any rights on this code

//This code is currently NOT used by anything

//Important is reloadTime in secs/shot

private ["_result", "_getAnyMagazines", "_findRecurse", "_class"];
_result = [];
_getAnyMagazines =
{
  private ["_weapon", "_mags"];
  _weapon = configFile >> "CfgWeapons" >> _this;
  _mags = [];
  {
    _mags = _mags + getArray ((if (_x == "this") then { _weapon } else { _weapon >> _x }) >> "magazines");
  } foreach getArray (_weapon >> "muzzles");
  _mags
};

_findRecurse =
{
  private ["_root", "_class", "_path", "_currentPath"];
  _root = (_this select 0);
  _path = +(_this select 1);
  for "_i" from 0 to count _root -1 do
  {
    _class = _root select _i;
    if (isClass _class) then
    {
      _currentPath = _path + [_i];
      {
        _result set [count _result, [_x, _x call _getAnyMagazines, _currentPath, str _class]];
      } foreach getArray (_class >> "weapons");
      _class = _class >> "turrets";
      if (isClass _class) then
      {
        [_class, _currentPath] call _findRecurse;
      };
    };
  };
};

_class =
(configFile >> "CfgVehicles" >>
(
  switch (typeName _this) do
  {
    case "STRING" : {_this};
    case "OBJECT" : {typeOf _this};
    default {nil}
  }
) >> "turrets"
);

[_class, []] call _findRecurse;
_result;
