_marcador = [marcadores,player] call BIS_fnc_nearestPosition;

_lado = side player;
_nombre = if (_lado == malos) then {nameMalos} else {nameMuyMalos};

if (lados getVariable [_marcador,sideUnknown] != _lado) exitWith {hint format ["You need to be close to a zone belonging to %1 in order to request a vehicle",_nombre]};
if ((!(_marcador in aeropuertos)) and (!(_marcador in puertos)) and (!(_marcador in puestos))) exitWith {hint "You need to be close to an Airbase, Seaport or Outpost of your side in order to request a vehicle"};
if (not(player inArea _marcador)) exitWith {hint "You need to be close to an Airbase, Seaport or Outpost in order to request a vehicle"};

_tipoBike = if (_lado == malos) then {selectRandom vehNATOLightUnarmed} else {selectRandom vehCSATLightUnarmed};

if (!isNull moto) then
	{
	if (moto distance player < 100) then {deleteVehicle moto};
	};

hint "Vehicle available";
_pos = [];
_radius = 10;
while {_pos isEqualTo []} do
	{
	_pos = (position player) findEmptyPosition [5,_radius,"I_Truck_02_covered_F"];
	_radius = _radius + 10;
	};
moto = createVehicle [_tipoBike,_pos, [], 10, "NONE"];

[moto] call A3A_fnc_AIVEHinit;