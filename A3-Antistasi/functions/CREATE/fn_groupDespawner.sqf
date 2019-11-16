private ["_groupX","_sideX","_eny1","_eny2"];
_groupX = _this select 0;
_sideX = side _groupX;
_eny1 = Occupants;
_eny2 = Invaders;
if (_sideX == Occupants) then {_eny1 = teamPlayer} else {if (_sideX == Invaders) then {_eny2 = teamPlayer}};

{
  _unit = _x;
  if (!([distanceSPWN,1,_unit,_eny1] call A3A_fnc_distanceUnits) and !([distanceSPWN,1,_unit,_eny2] call A3A_fnc_distanceUnits)) then
  {
    deleteVehicle _unit;
  }
} forEach units _groupX;

{
  _unit = _x;
  waitUntil {sleep 1;!([distanceSPWN,1,_unit,_eny1] call A3A_fnc_distanceUnits) and !([distanceSPWN,1,_unit,_eny2] call A3A_fnc_distanceUnits)};
  deleteVehicle _unit;
} forEach units _groupX;

deleteGroup _groupX;
