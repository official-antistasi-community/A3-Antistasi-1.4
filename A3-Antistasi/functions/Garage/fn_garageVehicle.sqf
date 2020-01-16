#include "defineGarage.inc"

private ["_pool","_veh","_typeVehX"];
_pool = false;
if (_this select 0 || !isMultiplayer) then {_pool = true};

if (side player != teamPlayer) exitWith {hint "Only rebels can add vehicles to the garage."};
if (!([player] call A3A_fnc_isMember)) exitWith {hint "Only server members have the garage feature enabled"};

_veh = cursorTarget;

if (isNull _veh) exitWith {hint "You are not looking at a vehicle"};

if (!alive _veh) exitWith {hint "You cannot add destroyed vehicles to your garage"};
_closeX = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
_closeX = _closeX select {(player inArea _x) and (_veh inArea _x)};

if (_closeX isEqualTo []) exitWith {hint format ["You and the vehicle need to be in a %1 garrison surrounding in order to garage a it",nameTeamPlayer]};

//if (player distance2d getMarkerPos respawnTeamPlayer > 50) exitWith {hint "You must be closer than 50 meters to HQ"};

if ({alive _x} count (crew vehicle _veh) > 0) exitWith { hint "In order to store a vehicle, its crew must disembark."};

_typeVehX = typeOf _veh;

if (_veh isKindOf "Man") exitWith {hint "Are you kidding?"};

if !(_veh isKindOf "AllVehicles") exitWith {hint "The vehicle you are looking cannot be stored in our Garage"};


if (_pool and (count vehInGarage >= (tierWar *3))) exitWith {hint "You cannot garage more vehicles at your current War Level"};

_exit = false;
if (!_pool) then
	{
	_owner = _veh getVariable "ownerX";
	if (!isNil "_owner") then
		{
		if (_owner isEqualType "") then
			{
			if (getPlayerUID player != _owner) then {_exit = true};
			};
		};
	};

if (_exit) exitWith {hint "You are not owner of this vehicle therefore you cannot garage it"};

if (_typeVehX isKindOf "Plane") then
	{
	_airportsX = airportsX select {(sidesX getVariable [_x,sideUnknown] == teamPlayer) and (player inArea _x)};
	if (count _airportsX == 0) then {_exit = true};
	};

if (_exit) exitWith {hint format ["You cannot garage an air vehicle while you are not near an Aiport which belongs to %1. Place your HQ near an airbase flag in order to be able to garage it",nameTeamPlayer]};

if (_veh in staticsToSave) then {staticsToSave = staticsToSave - [_veh]; publicVariable "staticsToSave"};

[_veh,true] call A3A_fnc_empty;
if (_veh in reportedVehs) then {reportedVehs = reportedVehs - [_veh]; publicVariable "reportedVehs"};
if (_veh isKindOf "StaticWeapon") then {deleteVehicle _veh};
if (_pool) then
	{
	vehInGarage = vehInGarage + [_typeVehX];
	publicVariable "vehInGarage";
	hint format ["Vehicle added to %1 Garage",nameTeamPlayer];
	}
else
	{
	[_typeVehX] call A3A_fnc_addToPersonalGarageLocal;
	hint "Vehicle added to Personal Garage";
	};
