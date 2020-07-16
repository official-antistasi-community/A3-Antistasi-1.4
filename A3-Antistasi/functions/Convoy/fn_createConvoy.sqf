params ["_convoyID", "_units", "_origin", "_destination", "_markerArray", "_convoyType", "_convoySide"];

/*  Creates a convoy for simulated movement
*   Params:
*     _convoyID: NUMBER; the unique convoy ID
*     _units: ARRAY; contains the info about the units, each element has to be [veh, [crew], [cargoUnits]]
*     _origin: POS; contains the position of the starting point
*     _destination: POS; contains the position of the end point
*     _convoyType: STRING; contains one of "ATTACK", "PATROL" or "REINFORCE" + further
*     _convoySide: SIDE; contains the side of the convoy
*   Returns:
*     Nothing
*/

if (isNil "_convoyID") exitWith {diag_log "CreateConvoy: No convoy ID given"};
if (isNil "_units" || {count _units == 0}) exitWith {diag_log format ["CreateConvoy[%1]: No units given for convoy!", _convoyID]};
if (isNil "_origin") exitWith {diag_log format ["CreateConvoy[%1]: No origin given for the convoy!", _convoyID]};
if (isNil "_destination") exitWith {diag_log format ["CreateConvoy[%1]: No destination given for the convoy!", _convoyID]};

_hasAir = false;
_hasLand = false;

_velocity = 999999; //CAUTION this is km/h not m/s!!! So is every speed
{
    _vehicle = _x select 0;
    if (!(_vehicle isKindOf "StaticWeapon")) then
    {
      if(!_hasLand && {_vehicle isKindOf "Land"}) then {_hasLand = true;};
      if(!_hasAir && {_vehicle isKindOf "Air"}) then {_hasAir = true;};
      _vehVelocity = getNumber (configFile >> "cfgVehicles" >> _vehicle >> "maxSpeed");
      if (_vehVelocity < _velocity) then
      {
        _velocity = _vehVelocity;
      };
    };
} forEach _units;

if(_velocity == 999999) then
{
  //Standard velocity for man units (only static in convoy)
  _velocity = 24;
  _hasLand = true;
};

//Convert km/h into m/s
_velocity = (_velocity / 3.6);
_route = [];
_type = "";

if(_hasAir && {!_hasLand}) then
{
  //Convoy contains only air vehicles, can fly direct way
  _route = [_origin, _origin vectorAdd [0,0,200], _destination vectorAdd [0,0,200], _destination];
  _type = "Air";
}
else
{
  //Convoy is either pure land or combined air and land find way
  _route = [_origin, _destination] call A3A_fnc_findPath;
  if(_hasAir) then {_type = "Mixed"} else {_type = "Land"};
};

if (_route isEqualTo []) exitWith {
	diag_log format ["CreateConvoy[%1]: Unable to create convoy, no valid path. HasAir: %2, HasLand: %3", _convoyID, _hasAir, _hasLand];
};

_markerPrefix = if(colorTeamPlayer == "colorGUER") then {"b"} else {"n"};
if(_convoySide == Occupants) then {_markerPrefix = if(colorInvaders == "colorBLUFOR") then {"n"} else {"b"};};
if(_convoySide == Invaders) then {_markerPrefix = "o"};

_markerType = "_mech_inf";
if(_type == "Air") then {_markerType = "_air"};
if(_type == "Mixed") then {_markerType = "_armor"};

_convoyMarker = createMarker [format ["convoy%1", _convoyID], _origin];
_convoyMarker setMarkerShapeLocal "ICON";
_convoyMarker setMarkerType format ["%1%2", _markerPrefix, _markerType];

_convoyMarker setMarkerAlpha 0;

if(_convoySide == Occupants) then
{
    private _markerArray = server getVariable ["convoyMarker_Occupants", []];
    _markerArray pushBack _convoyMarker;
    server setVariable ["convoyMarker_Occupants", _markerArray, true];
    _convoyMarker setMarkerText (format ["[GPS-%3] %1 %2 Convoy", nameOccupants, _convoyType, _convoyID]);
}
else
{
    private _markerArray = server getVariable ["convoyMarker_Invaders", []];
    _markerArray pushBack _convoyMarker;
    server setVariable ["convoyMarker_Invaders", _markerArray, true];
    _convoyMarker setMarkerText (format ["[GPS-%3] %1 %2 Convoy", nameInvaders, _convoyType, _convoyID]);
};


diag_log format ["CreateConvoy[%1]: Created convoy with %2 m/s and a total of %3 waypoints, marker is %4%5", _convoyID, _velocity, count _route, _markerPrefix, _markerType];

[_convoyID, _route, _markerArray, _velocity, _units, _convoySide, _convoyType, (!_hasLand)] spawn A3A_fnc_convoyMovement;
