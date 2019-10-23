private ["_pool","_veh","_tipoVeh"];
_pool = false;
if (_this select 0) then {_pool = true};
_veh = cursorTarget;

if (isNull _veh) exitWith {hint "You are not looking at a vehicle"};

if (!alive _veh) exitWith {hint "You cannot add destroyed vehicles to your garage"};
_cercanos = marcadores select {lados getVariable [_x,sideUnknown] == buenos};
_cercanos = _cercanos select {(player inArea _x) and (_veh inArea _x)};

if (_cercanos isEqualTo []) exitWith {hint format ["You and the vehicle need to be in a %1 garrison surrounding in order to garage a it",nameBuenos]};

//if (player distance2d getMarkerPos respawnBuenos > 50) exitWith {hint "You must be closer than 50 meters to HQ"};

if ({alive _x} count (crew vehicle _veh) > 0) exitWith { hint "In order to store a vehicle, its crew must disembark."};

_tipoVeh = typeOf _veh;

if (_veh isKindOf "Man") exitWith {hint "Are you kidding?"};

if !(_veh isKindOf "AllVehicles") exitWith {hint "The vehicle you are looking cannot be stored in our Garage"};
if (!_pool and !([player] call A3A_fnc_isMember)) exitWith {hint "Only server members have the garage feature enabled"};

if (_pool and (count vehInGarage >= (tierWar *3))) exitWith {hint "You cannot garage more vehicles at your current War Level"};

_exit = false;
if (!_pool) then
	{
	_owner = _veh getVariable "duenyo";
	if (!isNil "_owner") then
		{
		if (_owner isEqualType "") then
			{
			if (getPlayerUID player != _owner) then {_exit = true};
			};
		};
	};

if (_exit) exitWith {hint "You are not owner of this vehicle therefore you cannot garage it"};

if (_tipoVeh isKindOf "Plane") then
	{
	_aeropuertos = aeropuertos select {(lados getVariable [_x,sideUnknown] == buenos) and (player inArea _x)};
	if (count _aeropuertos == 0) then {_exit = true};
	};

if (_exit) exitWith {hint format ["You cannot garage an air vehicle while you are not near an Aiport which belongs to %1. Place your HQ near an airbase flag in order to be able to garage it",nameBuenos]};

if (_veh in staticsToSave) then {staticsToSave = staticsToSave - [_veh]; publicVariable "staticsToSave"};

[_veh,true] call A3A_fnc_vaciar;
if (_veh in reportedVehs) then {reportedVehs = reportedVehs - [_veh]; publicVariable "reportedVehs"};
if (_veh isKindOf "StaticWeapon") then {deleteVehicle _veh};
if (_pool) then
	{
	vehInGarage = vehInGarage + [_tipoVeh];
	publicVariable "vehInGarage";
	hint format ["Vehicle added to %1 Garage",nameBuenos];
	}
else
	{
	personalGarage = personalGarage + [_tipoVeh];
	hint "Vehicle added to Personal Garage";
	};
