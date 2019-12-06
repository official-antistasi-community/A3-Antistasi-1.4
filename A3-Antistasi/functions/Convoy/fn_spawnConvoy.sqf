//params ["_convoyID", "_units", "_posArray", "_markers", "_convoySide", "_convoyType", "_maxSpeed"];
params ["_convoyID", "_units", "_pos", "_route", "_markers", "_convoySide", "_convoyType", "_maxSpeed"];


private ["_targetPos", "_dir", "_startMarker", "_targetMarker", "_convoyMarker", "_road"];

_targetPos = _route select (count _route - 1);

//Disabled markers as there isn't sufficient information in createConvoy to give them to spawnConvoy.
//There is now :D
_startMarker = _markers select 0;
_targetMarker = _markers select 1;
//Temporary start marker, to send the convoy off to the carrier.

_convoyMarker = format ["convoy%1", _convoyID];
_convoyMarker setMarkerText (format ["%1 Convoy [%2]: Spawned", _convoyType, _convoyID]);

//Find near road segments
// Should already be on or near a road
// Shouldn't do this for all-air convoys
_road = roadAt _pos;
if(isNull _road) then
{
  private _radius = 3;
  private _possibleRoads = [];
  while {isNull _road && {_radius < 50}} do
  {
    _possibleRoads = _pos nearRoads _radius;
    if(count _possibleRoads > 0) then
    {
      _road = _possibleRoads select 0;
    }
    else
    {
      _radius = _radius * 1.5;
    };
  };
  if(!(isNull _road)) then
  {
    _pos = (getPos _road);
  };
};
// Don't reposition if we're on a road. Might move past waypoint because roadAt doesn't guarantee nearest.


//Conversion back to km/h
_maxSpeed = _maxSpeed * 3.6;

//Spawn a bit above the ground
_pos = _pos vectorAdd [0,0,0.1];
_dir = _pos getDir (_route select 0);

private ["_data", "_lineData", "_cargoGroup", "_vehicle", "_wp0"];

private _createdUnits = [];
private _allGroups = [];
private _airVehicles = [];
private _landVehicles = [];

diag_log format ["Spawning in convoy %1", _convoyID];
[_units, "Convoy Units"] call A3A_fnc_logArray;


for "_i" from 0 to ((count _units) - 1) do
{
  _data = _units select _i;
  _lineData = [_data, _convoySide, _pos, _dir] call A3A_fnc_spawnConvoyLine;

  //Pushback the spawned objects
  _unitObjects = _lineData select 0;
  _createdUnits pushBack _unitObjects;

  //Pushback the groups
  private _vehicleGroup = (_lineData select 1);
  // Driver will be set to CARELESS/BLUE by the FSM. If set for everyone, gunners remain unbuttoned
  _vehicleGroup setBehaviour "SAFE";
//  _vehicleGroup setCombatMode "BLUE";
  _allGroups pushBackUnique _vehicleGroup;

  _cargoGroup = (_lineData select 2);
  if(_cargoGroup != grpNull) then
  {
    _allGroups pushBack _cargoGroup;
    _cargoGroup setBehaviour "SAFE";
  };

  //Select vehicle type
  _vehicle = _unitObjects select 0;
  if (_vehicle != objNull) then {

    // In theory you could have foot convoys? I don't think they're properly supported yet.
    // everything here acts on vehicles anyway

    _vehicle setVariable ["vehGroup", _vehicleGroup];
    _vehicle setVariable ["cargoGroup", _cargoGroup];

    // Removed (for ground) because spawning looks visually weird anyway due to spawn lag prevention delays
    // plus extra logic is necessary to avoid throwing vehicles off corners
	// Consider adding back in if vehicles are moved into position after spawning is complete
    //    _vehicle setVelocity ((vectorDir _vehicle) vectorMultiply (_maxSpeed / 3.6));

    if(_vehicle isKindOf "Air") then
    {
      _airVehicles pushBack _vehicle;

      // Just direct it above the target for now
      _wp0 = (group _vehicle) addWaypoint [(_targetPos vectorAdd [0,0,30]), -1, 0];
      _wp0 setWaypointBehaviour "SAFE";
      (group _vehicle) setCurrentWaypoint _wp0;
	  _vehicle setVelocity ((vectorDir _vehicle) vectorMultiply (_maxSpeed / 3.6));
    }
    else
    {
      _landVehicles pushBack _vehicle;
      _vehicle limitSpeed _maxSpeed;
      [_vehicle, _route] execFSM "FSMs\DriveAlongPath.fsm";
    };

    // This probably does nothing with the FSM?
    _vehicle setConvoySeparation (if(_i == 1 && {_convoyType == "convoy"}) then {80} else {30});

	// lastSpawn time check will try anyway if a vehicle gets stuck
	private _lastSpawn = time;
    waituntil {sleep 1; ((_vehicle distance2d _pos) > 15) or ((time - _lastSpawn) > 20)};
  };
};

diag_log format ["Convoy[%1]: Convoy consists of %1 air vehicles and %2 land vehicles", count _airVehicles, count _landVehicles];

//Let helicopter follow the vehicles and vehicles
// Crashes probably happen with multiple air vehicles
if(count _landVehicles > 0) then {
  {
      [selectRandom _landVehicles, _x, _targetPos, _maxSpeed * 1.5] spawn A3A_fnc_followVehicle;
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
  (_checkPos distance2D _targetPos < 100) ||
  {!([distanceSPWN * 1.2, 1, _checkPos, teamPlayer] call A3A_fnc_distanceUnits)}
};

deleteMarker _convoyMarker;

if (_convoyDead) exitWith
{
  server setVariable [format ["Con%1", _convoyID], nil, true];
	diag_log format ["%1 Convoy [%2]: All units dead. Convoy terminated.", _convoyType, _convoyID];
	{
		_x deleteGroupWhenEmpty true;
	} forEach _allGroups;
};

if(_checkPos distance2D _targetPos < 100) then
{
  [_convoyID, _createdUnits, _checkPos, _targetPos, _markerArray, _convoyType, _convoySide] call A3A_fnc_onSpawnedArrival;
}
else
{
  [_convoyID, _createdUnits, _checkPos, _targetPos, _markerArray, _convoyType, _convoySide] call A3A_fnc_despawnConvoy;
};
