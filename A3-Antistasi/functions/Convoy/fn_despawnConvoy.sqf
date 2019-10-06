params ["_convoyID", "_unitObjects", "_convoyPos", "_target", "_markerArray", "_convoyType", "_convoySide"];

_convoyData = [];
for "_i" from 0 to ((count _unitObjects) - 1) do
{
  _data = _unitObjects select _i;
  _vehicle = _data select 0;
  _crew = _data select 1;
  _cargo = _data select 2;

  _convoyLine = [];

  //Deleting cargo first
  _cargoData = [];
  if(count _cargo > 0) then
  {
    //waitUntil {sleep 1; !([distanceSPWN * 1.2, 1, getPos (leader (_cargo select 0)), teamPlayer] call A3A_fnc_distanceUnits)};
    {
      if(alive _x) then
      {
        _cargoData pushBack (typeOf _x);
        deleteVehicle _x;
      };
    } forEach _cargo;
  };
  _convoyLine set [2, _cargoData];

  //Deleting crew after it
  _crewData = [];
  if(count _crew > 0) then
  {
    waitUntil {sleep 1; !([distanceSPWN * 1.2, 1, getPos (leader (_crew select 0)), teamPlayer] call A3A_fnc_distanceUnits)};
    {
      if(alive _x) then
      {
        _crewData pushBack (typeOf _x);
        deleteVehicle _x;
      };
    } forEach _crew;
  };
  _convoyLine set [1, _crewData];

  //Deleting vehicle last
  if(!isNull _vehicle) then
  {
    //waitUntil {sleep 0.25; !([distanceSPWN * 1.2, 1, getPos _vehicle, teamPlayer] call A3A_fnc_distanceUnits)};
    //_vehicle setVelocity [0,0,0];
    if(alive _vehicle) then
    {
      _convoyLine set [0, typeOf _vehicle];
    }
    else
    {
      _convoyLine set [0, ""];
    };
    deleteVehicle _vehicle;
  }
  else
  {
    _convoyLine set [0, ""];
  };

  _convoyData pushBack _convoyLine;
};

{
    deleteGroup _x;
} forEach _allGroups;

[_convoyID, _convoyData, _convoyPos, _target, _markerArray, _convoyType, _convoySide] spawn A3A_fnc_createConvoy;
