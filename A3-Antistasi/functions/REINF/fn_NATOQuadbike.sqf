_markerX = [markersX,player] call BIS_fnc_nearestPosition;

_sideX = side player;
_nameX = if (_sideX == Occupants) then {nameOccupants} else {nameInvaders};

if (sidesX getVariable [_markerX,sideUnknown] != _sideX) exitWith {hint format ["You need to be close to a zone belonging to %1 in order to request a vehicle",_nameX]};
if ((!(_markerX in airportsX)) and (!(_markerX in seaports)) and (!(_markerX in outposts))) exitWith {hint "You need to be close to an Airbase, Seaport or Outpost of your side in order to request a vehicle"};
if (not(player inArea _markerX)) exitWith {hint "You need to be close to an Airbase, Seaport or Outpost in order to request a vehicle"};

_typeBike = if (_sideX == Occupants) then {selectRandom vehNATOPVP} else {selectRandom vehCSATPVP};

if (!isNull lastVehicleSpawned) then
	{
	if (lastVehicleSpawned distance player < 100) then {deleteVehicle lastVehicleSpawned};
	};

hint "Vehicle available";
_pos = [];
_radius = 10;
while {_pos isEqualTo []} do
	{
	_pos = (position player) findEmptyPosition [5,_radius,"I_Truck_02_covered_F"];
	_radius = _radius + 10;
	};
lastVehicleSpawned = createVehicle [_typeBike,_pos, [], 10, "NONE"];

[lastVehicleSpawned] call A3A_fnc_AIVEHinit;
