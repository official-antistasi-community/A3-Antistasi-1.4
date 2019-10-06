params ["_convoyID", "_units", "_posArray", "_markers", "_convoySide", "_convoyType", "_maxSpeed"];


private ["_pos", "_nextPos", "_target", "_dir", "_startMarker", "_targetMarker", "_convoyMarker", "_road", "_radius", "_possibleRoads"];

_pos = _posArray select 0;
_nextPos = _posArray select 1;
_target = _posArray select 2;

_dir = _pos getDir _nextPos;

//Disabled markers as there isn't sufficient information in createConvoy to give them to spawnConvoy.
//There is now :D
_startMarker = _markers select 0;
_targetMarker = _markers select 1;
//Temporary start marker, to send the convoy off to the carrier.

_convoyMarker = format ["convoy%1", _convoyID];
_convoyMarker setMarkerText (format ["%1 Convoy [%2]: Spawned", _convoyType, _convoyID]);

//Find near road segments
_road = roadAt _pos;
if(isNull _road) then
{
  _radius = 3;
  _possibleRoads = [];
  while {isNull _road && {_radius < 50}} do
  {
    _possibleRoads = _pos nearRoads _radius;
    if(count _possibleRoads > 0) then
    {
      _road = _possibleRoads select 0;
    }
    else
    {
      _radius = _radius + 1;
    };
  };
};

if(!(isNull _road)) then
{
  _pos = (getPos _road);
};

//Conversion back to km/h
_maxSpeed = _maxSpeed * 3.6;

//Spawn a bit above the ground
_pos = _pos vectorAdd [0,0,0.1];

private ["_data", "_lineData", "_cargoGroup", "_vehicle", "_wp0"];

private _createdUnits = [];
private _allGroups = [];
private _airVehicles = [];
private _landVehicles = [];

diag_log "Spawning in convoy";
[_units, "Convoy Units"] call A3A_fnc_logArray;

private _landVehicleGroup = createGroup _convoySide;
//Attempting to reduce how often convoys get stuck.
_landVehicleGroup setFormation "COLUMN";

for "_i" from 0 to ((count _units) - 1) do
{
  _data = _units select _i;
  _lineData = [_data, _convoySide, _pos, _dir, _landVehicleGroup] call A3A_fnc_spawnConvoyLine;

  //Pushback the spawned objects
  _unitObjects = _lineData select 0;
  _createdUnits pushBack _unitObjects;

  //Pushback the groups
  private _vehicleGroup = (_lineData select 1);
  _vehicleGroup setBehaviour "CARELESS";
  _allGroups pushBackUnique _vehicleGroup;

  _cargoGroup = (_lineData select 2);
  if(_cargoGroup != grpNull) then
  {
    _allGroups pushBack _cargoGroup;
    _cargoGroup setBehaviour "CARELESS";
  };

  //Select vehicle type
  _vehicle = _unitObjects select 0;
  if(_vehicle isKindOf "Air") then
  {
    _airVehicles pushBack _vehicle;
  }
  else
  {
    _landVehicles pushBack _vehicle;
  };
  //Push vehicles forward
  _vehicle setVelocity ((vectorDir _vehicle) vectorMultiply 20);

  if(_vehicle != objNull) then
  {
    if(_i == 1 && {_convoyType == "convoy"}) then
    {
      _vehicle setConvoySeparation 80;
    }
    else
    {
      _vehicle setConvoySeparation 30;
    };
  };

  _vehicle setVariable ["vehGroup", _vehicleGroup];
  _vehicle setVariable ["cargoGroup", _cargoGroup];

  waitUntil {sleep 0.5; ((_vehicle distance _pos) > 10)};
};

//Let helicopter follow the vehicles and vehicles have a speed limit
if(count _landVehicles > 0) then
{
  {
      _x limitSpeed _maxSpeed;
  } forEach _landVehicles;
  {
      [selectRandom _landVehicles, _x, _target, _maxSpeed * 1.5] spawn A3A_fnc_followVehicle;
  } forEach _airVehicles;
  
  //Create marker for the crew
  [_markers select 0, _markers select 1, _landVehicleGroup] call A3A_fnc_WPCreate;
  diag_log format ["Convoy [%1]: Waypoint count is %2", _convoyID, count (wayPoints _landVehicleGroup)];
  _wp0 = (wayPoints _landVehicleGroup) select 0;
  _wp0 setWaypointBehaviour "SAFE";
}
else
{
  //No vehicle found, fly direct way
  {
    _wp0 = (group _x) addWaypoint [(_target vectorAdd [0,0,30]), -1];
    _wp0 setWaypointBehaviour "SAFE";
  } forEach _airVehicles;
};

private _fnc_firstAliveUnit = {
	private _result = objNull;
	{
		private _units = units _x;
		private _unitIndex =  _units findIf {alive _x};
		if (_unitIndex > -1) exitWith {
			_result = _units select _unitIndex;
		};
	} forEach _allGroups;
	_result;
};

private _markedUnit = call _fnc_firstAliveUnit;
private _checkPos = [];
private _convoyDead = false;

waitUntil
{
  sleep 1;
  _markedUnit = if (alive _markedUnit) then {_markedUnit} else {call _fnc_firstAliveUnit};
  if (_markedUnit == objNull) exitWith {_convoyDead = true; true;};
  
  _checkPos = getPos _markedUnit;
  _convoyMarker setMarkerPos _checkPos;
  (_checkPos distance2D _target < 100) ||
  {!([distanceSPWN * 1.2, 1, _checkPos, teamPlayer] call A3A_fnc_distanceUnits)}
};

deleteMarker _convoyMarker;

if (_convoyDead) exitWith {
	diag_log format ["%1 Convoy [%2]: All units dead. Convoy terminated.", _convoyType, _convoyID];
	{
		_x deleteGroupWhenEmpty true;
	} forEach _allGroups;
};

if(_checkPos distance2D _target < 100) then
{
  [_convoyID, _createdUnits, _checkPos, _target, _markerArray, _convoyType, _convoySide] call A3A_fnc_onSpawnedArrival;
}
else
{
  [_convoyID, _createdUnits, _checkPos, _target, _markerArray, _convoyType, _convoySide] call A3A_fnc_despawnConvoy;
};
