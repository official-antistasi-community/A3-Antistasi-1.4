params ["_convoyID", "_units", "_pos", "_route", "_markers", "_convoySide", "_convoyType", "_maxSpeed", "_isAir"];


private ["_targetPos", "_dir", "_convoyMarker"];

_targetPos = _route select (count _route - 1);

_convoyMarker = format ["convoy%1", _convoyID];

if (!_isAir) then {
	private _road = roadAt _pos;
	// don't reposition if we're already near a road, can cause backwards driving
	if(isNull _road) then
	{
		private _radius = 3;
		private _possibleRoads = [];
		while {isNull _road && {_radius < 50}} do
		{
			_possibleRoads = _pos nearRoads _radius;
			if(count _possibleRoads > 0) then { _road = _possibleRoads select 0 }
			else { _radius = _radius * 1.5 };
		};
		if(!(isNull _road)) then { _pos = (getPos _road) };
	};
};

//Spawn a bit above the ground
_pos = _pos vectorAdd [0,0,0.1];
_dir = _pos getDir (_route select 0);
private _targetDir = _pos vectorFromTo _targetPos;
private _airOffset = (_targetDir vectorMultiply 200) vectorAdd [0,0,50];

private _createdUnits = [];
private _airVehicles = [];
private _landVehicles = [];

[2, format ["Spawning in convoy %1", _convoyID], "fn_spawnConvoy"] call A3A_fnc_log;
[_units, "Convoy Units"] call A3A_fnc_logArray;

for "_i" from 0 to ((count _units) - 1) do
{
	private _lineData = [_units select _i, _convoySide, _pos, _dir] call A3A_fnc_spawnConvoyLine;

	//Pushback the spawned objects
	private _unitObjects = _lineData select 0;
	_createdUnits pushBack _unitObjects;

	private _vehicle = _unitObjects select 0;
	if (_vehicle != objNull) then {

		if(_vehicle isKindOf "Air") then
		{
			_airVehicles pushBack _vehicle;
			_vehicle setVelocity ((vectorDir _vehicle) vectorMultiply (30));
			private _fsm = [_vehicle, _airOffset, _markers, _convoyType] execFSM "FSMs\ConvoyTravelAir.fsm";
			_vehicle setVariable ["fsm", _fsm];

			_airOffset = _airOffset vectorAdd (_targetDir vectorMultiply -200);
			if (!_isAir) then { _vehicle setVariable ["followpos", _pos] };
		}
		else
		{
			_landVehicles pushBack _vehicle;
			_vehicle limitSpeed _maxSpeed * 3.6;
			private _fsm = [_vehicle, _route, _markers, _convoyType] execFSM "FSMs\ConvoyTravel.fsm";
			_vehicle setVariable ["fsm", _fsm];
		};

		// lastSpawn time check will try anyway if a vehicle gets stuck
		private _lastSpawn = time;
		waituntil {sleep 1; ((_vehicle distance2d _pos) > 15) or ((time - _lastSpawn) > 20)};
	}
	else {
		[3, "Convoy line has no vehicle, unhandled", "fn_spawnConvoy"] call A3A_fnc_log;
	};
};

private _failure = 0;

// Monitor convoy vehicles for FSM completion and spawn distance
while {true} do
{
	sleep 2;
	private _despawn = true;

	// Check whether each vehicle in the convoy (controlled by FSM) has completed its mission
	// check last-to-first so that array deletion works correctly
	for "_i" from ((count _createdUnits) - 1) to 0 step -1 do {

		private _units = _createdUnits select _i;
		private _veh = _units select 0;
		private _result = if (isNull _veh) then {-10} else {_veh getVariable["fsmresult", 0]};

		if (_result != 0) then {		// completed or abandoned mission, don't track here anymore
			if (_result < 0) then { _failure = _failure + 1 };		// convoy vehicle failed to reach target
			_createdUnits deleteAt _i;
			_airVehicles deleteAt (_airVehicles find _veh);
			_landVehicles deleteAt (_landVehicles find _veh);
			[3, format["Vehicle FSM result %1, rem units %2", _result, count _createdUnits], "fn_spawnConvoy"] call A3A_fnc_log;
		}
		else {
			if ([distanceSPWN*1.2, 1, getPos _veh, teamPlayer] call A3A_fnc_distanceUnits) then { _despawn = false };
		};
	};

	// no tracked vehicles remaining in convoy, terminate
	if (count _createdUnits == 0) exitWith {
		deleteMarker _convoyMarker;
		server setVariable [format ["Con%1", _convoyID], nil, true];
		[2, format ["%1 Convoy [%2]: Terminated", _convoyType, _convoyID], "fn_spawnConvoy"] call A3A_fnc_log;

		if (_failure > 0) then {
			// At least one vehicle failed, add base/target to killZones to avoid repetition
			private _kzlist = killZones getVariable [_markers#0, []];
			_kzlist pushBack _markers#1;
			killZones setVariable [_markers#0, _kzlist, true];
		};
	};

	// Have at least one remaining vehicle if we got here
	private _convoyPos = [0,0,0];
	if (count _landVehicles != 0) then {
		_convoyPos = getPos (_landVehicles select 0);
		{ _x setVariable["followpos", _convoyPos] } forEach _airVehicles;		// used by FSM to circle around
		// can potentially set ground vehicle follow chain here too
	}
	else {
		_convoyPos = getPos (_airVehicles select 0);
		{ _x setVariable["followpos", nil] } forEach _airVehicles;
	};
	_convoyMarker setMarkerPos _convoyPos;

	// all convoy vehicles out of spawn distance, switch back to simulation
	if (_despawn) exitWith {
		deleteMarker _convoyMarker;			// because we're using createConvoy rather than convoyMovement to restart sim
		[_convoyID, _createdUnits, _convoyPos, _targetPos, _markerArray, _convoyType, _convoySide] call A3A_fnc_despawnConvoy;
	};
};
