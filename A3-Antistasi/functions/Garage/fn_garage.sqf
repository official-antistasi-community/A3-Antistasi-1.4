#include "defineGarage.inc"

if (!(isNil "placingVehicle") && {placingVehicle}) exitWith {["Garage", "Unable to open garage, you are already placing something"] call A3A_fnc_customHint;};
if (isNil "garageIsOpen") then {
	garageIsOpen = false;
};

garage_mode = _this select 0;

if (garage_mode == GARAGE_FACTION && (not([player] call A3A_fnc_isMember))) exitWith {["Garage", "You cannot access the Garage as you are guest in this server"] call A3A_fnc_customHint;};
if (garage_mode == GARAGE_FACTION && !allowMembersFactionGarageAccess && player != theBoss) exitWith {["Garage", "Member access to the faction garage is disabled. You must be the commander."] call A3A_fnc_customHint;};
if (player != player getVariable "owner") exitWith {["Garage", "You cannot access the Garage while you are controlling AI"] call A3A_fnc_customHint;};
if ([player,300] call A3A_fnc_enemyNearCheck) exitWith {["Garage", "You cannot manage the Garage with enemies nearby"] call A3A_fnc_customHint;};

garage_vehiclesAvailable = [];

//Build a list of the vehicles available to us at this location
_hasAir = false;
_airportsX = airportsX select {(sidesX getVariable [_x,sideUnknown] == teamPlayer) and (player inArea _x)};
if (count _airportsX > 0) then {_hasAir = true};
{
	if (_x in vehPlanes) then
		{
		if (_hasAir) then {garage_vehiclesAvailable pushBack _x};
		}
	else
		{
		garage_vehiclesAvailable pushBack _x;
		};
} forEach (if (garage_mode == GARAGE_FACTION) then {vehInGarage} else {[] call A3A_fnc_getPersonalGarageLocal});

if (count garage_vehiclesAvailable == 0) exitWith {hintC "The Garage is empty or the vehicles you have are not suitable to recover in the place you are.\n\nAir vehicles need to be recovered near Airport flags."};

garage_nearestMarker = [markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer},player] call BIS_fnc_nearestPosition;
if !(player inArea garage_nearestMarker) exitWith {["Garage", "You need to be close to one of your garrisons to be able to retrieve a vehicle from your garage"] call A3A_fnc_customHint;};

garage_vehicleIndex = 0;
_initialType = garage_vehiclesAvailable select garage_vehicleIndex;

#define KEY_UP 200
#define KEY_DOWN 208

//We define this once and never remove it
//Because removing handlers can cause the IDs other handlers to change, stopping them being removed.
if (isNil "garage_keyDownHandler") then {
	garage_keyDownHandler = (findDisplay 46) displayAddEventHandler ["KeyDown",
	{
		if (!garageIsOpen) exitWith {false;};
		private _handled = false;
		private _leave = false;
		//Next vehicle
		if (_this select 1 == KEY_UP) then
			{
			_handled = true;
			if (garage_vehicleIndex + 1 > (count garage_vehiclesAvailable) - 1) then {garage_vehicleIndex = 0} else {garage_vehicleIndex = garage_vehicleIndex + 1};
			private _type = garage_vehiclesAvailable select garage_vehicleIndex;
			[_type] call A3A_fnc_vehPlacementChangeVehicle;
			};
		//Previous vehicle
		if (_this select 1 == KEY_DOWN) then
			{
			_handled = true;
			if (garage_vehicleIndex - 1 < 0) then {garage_vehicleIndex = (count garage_vehiclesAvailable) - 1} else {garage_vehicleIndex = garage_vehicleIndex - 1};
					private _type = garage_vehiclesAvailable select garage_vehicleIndex;
			[_type] call A3A_fnc_vehPlacementChangeVehicle;
			};
		_handled;
	}];
};
private _extraMessage = "Arrow Up-Down to Switch Vehicles<br/>";

//Only allow access to the faction garage if someone else isn't already accessing it. 
//Try to find the player to make sure they're still online - aim to avoid a situation where players are locked out of the garage.
if (garage_mode == GARAGE_FACTION && !isNil "garageLocked" && {(allPlayers findIf { getPlayerUID _x == (garageLocked select 1)}) > -1}) exitWith {
	["Garage", format ["%1 is accessing the garage right now. Please try again later. If this is broken, ask the player to log out.", garageLocked select 0]] call A3A_fnc_customHint;
};
//Define this last-thing, as we need to vehPlacement cleanup code to unset it.
garageLocked = [name player, getPlayerUID player];
publicVariable "garageLocked";

garageIsOpen = true;
[_initialType, "GARAGE", _extraMessage] call A3A_fnc_vehPlacementBegin;