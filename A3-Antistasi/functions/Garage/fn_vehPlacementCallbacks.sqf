#include "defineGarage.inc"

params ["_callbackTarget", "_callbackType", ["_callbackParams", []]];

/* 
CALLBACK_VEH_PLACED_SUCCESSFULLY - Passed the created vehicle, no return needed. Only called if vehicle successfully created.
CALLBACK_VEH_PLACEMENT_CANCELLED - No parameters, no return needed
CALLBACK_SHOULD_CANCEL_PLACEMENT - Passed a temporary preview vehicle, return format [shouldCancel: bool, messageOnCancel: string]
CALLBACK_CAN_PLACE_VEH - Passed position, direction and vehicle class, return format [canPlace: bool, messageOnUnableTo: string]
CALLBACK_VEH_PLACEMENT_CLEANUP - Passed nothing, no return needed. Called just before vehicle placement totally finishes. Should always be called.
CALLBACK_VEH_IS_VALID_LOCATION - Passed position, direction and vehicle class. Return format [canPlace: bool, messageOnUnableTo: string]
CALLBACK_VEH_CUSTOM_CREATE_VEHICLE - Given a class, position and direction. Return vehicle created.
*/

switch (_callbackTarget) do {
	case "GARAGE": {
		switch (_callbackType) do {
			case CALLBACK_VEH_PLACEMENT_CLEANUP: {
				garageIsOpen = false;
				garageLocked = nil;
				publicVariable "garageLocked";
			};
		
			case CALLBACK_VEH_PLACEMENT_CANCELLED: {
			};
		
			case CALLBACK_SHOULD_CANCEL_PLACEMENT: {
				if (!(player inArea garage_nearestMarker)) exitWith {
					[true, "You need to be close to one of your garrisons to be able to retrieve a vehicle from your garage"];
				};
				[false];
			};
			
			case CALLBACK_VEH_IS_VALID_LOCATION: {
				private _pos = _callbackParams select 0;
				private _maxDist = [50,150] select ((_callbackParams select 2) isKindOf "Ship");
				if (_pos distance2d (getMarkerPos garage_nearestMarker) > _maxDist) exitWith
				{
					[false, format ["This vehicle must be placed within %1m of the flag", _maxDist]];
				};
				[true];
			};
		
			case CALLBACK_CAN_PLACE_VEH: {
				if (!(player inArea garage_nearestMarker)) exitWith 
				{
					[false, "You need to be close to one of your garrisons to be able to retrieve a vehicle from your garage"];
				};
				if ([player,300] call A3A_fnc_enemyNearCheck) exitWith
				{
					[false, "You cannot manage the Garage with enemies nearby"];
				};
				[true];
			};
		
			case CALLBACK_VEH_PLACED_SUCCESSFULLY: {
				private _garageVeh = _callbackParams param [0];
				[_garageVeh, teamPlayer] call A3A_fnc_AIVEHinit;
				if !(_garageVeh isKindOf "StaticWeapon") then { [_garageVeh] spawn A3A_fnc_vehDespawner };

				if (_garageVeh isKindOf "Car") then {_garageVeh setPlateNumber format ["%1",name player]};
				
				//Handle Garage removal
				private _newArr = [];
				private _found = false;
				if (garage_mode == GARAGE_FACTION) then
					{
					{
						if ((_x != (garage_vehiclesAvailable select garage_vehicleIndex)) or (_found)) then {_newArr pushBack _x} else {_found = true};
					} forEach vehInGarage;
					vehInGarage = _newArr;
					publicVariable "vehInGarage";
					}
				else
					{
					{
						if ((_x != (garage_vehiclesAvailable select garage_vehicleIndex)) or (_found)) then {_newArr pushBack _x} else {_found = true};
					} forEach ([] call A3A_fnc_getPersonalGarageLocal);
					[_newArr] call A3A_fnc_setPersonalGarageLocal;
					_garageVeh setVariable ["ownerX",getPlayerUID player,true];
					};
				if (_garageVeh isKindOf "StaticWeapon") then {staticsToSave pushBack _garageVeh; publicVariable "staticsToSave"};
			};
			
			case CALLBACK_VEH_CUSTOM_CREATE_VEHICLE: {
				_callbackParams params ["_vehicleType", "_pos", "_dir"];
				[_vehicleType, _pos, _dir] call A3A_fnc_placeEmptyVehicle;
			};
		};
	};
	
	case "BUYFIA": {
		switch (_callbackType) do {
			case CALLBACK_VEH_PLACEMENT_CLEANUP: {
				garageIsOpen = false;
			};
		
			case CALLBACK_VEH_PLACEMENT_CANCELLED: {
			};
		
			case CALLBACK_SHOULD_CANCEL_PLACEMENT: {
				if (!(player inArea vehiclePurchase_nearestMarker)) exitWith {
					[true, "You need to be close to the flag to be able to purchase a vehicle"];
				};
				[false];
			};
			
			case CALLBACK_VEH_IS_VALID_LOCATION: {
				private _pos = _callbackParams select 0;
				private _maxDist = [50,150] select ((_callbackParams select 2) isKindOf "Ship");
				if (_pos distance2d (getMarkerPos vehiclePurchase_nearestMarker) > _maxDist) exitWith
				{
					[false, format ["This vehicle must be placed within %1m of the flag", _maxDist]];
				};
				[true];
			};
		
			case CALLBACK_CAN_PLACE_VEH: {
				if (!(player inArea vehiclePurchase_nearestMarker)) exitWith 
				{
					[false, "You need to be close to one of your garrisons to be able to retrieve a vehicle from your garage"];
				};
				if ([player,300] call A3A_fnc_enemyNearCheck) exitWith
				{
					[false, "You cannotbuy vehicles with enemies nearby"];
				};
				[true];
			};
		
			case CALLBACK_VEH_PLACED_SUCCESSFULLY: {
				private _purchasedVeh = _callbackParams param [0];
				private _typeVehX = typeOf _purchasedVeh;
				
				[_purchasedVeh, teamPlayer] call A3A_fnc_AIVEHinit;
				if !(_purchasedVeh isKindOf "StaticWeapon") then { [_purchasedVeh] spawn A3A_fnc_vehDespawner };

				if (_purchasedVeh isKindOf "Car") then {_purchasedVeh setPlateNumber format ["%1",name player]};
				
				//Handle Money
				if (!isMultiplayer) then
					{
					[0,(-1 * vehiclePurchase_cost)] spawn A3A_fnc_resourcesFIA;
					}
				else
					{
					if (player ==	theBoss && ((_typeVehX == SDKMortar) or (_typeVehX == staticATteamPlayer) or (_typeVehX == staticAAteamPlayer) or (_typeVehX == SDKMGStatic))) then
						{
						_nul = [0,(-1 * vehiclePurchase_cost)] remoteExec ["A3A_fnc_resourcesFIA",2]
						}
					else
						{
						[-1 * vehiclePurchase_cost] call A3A_fnc_resourcesPlayer;
						_purchasedVeh setVariable ["ownerX",getPlayerUID player,true];
						};
					};
				if (_purchasedVeh isKindOf "StaticWeapon") then {staticsToSave pushBackUnique _purchasedVeh; publicVariable "staticsToSave"};

				//hint "Vehicle Purchased";
				player reveal _purchasedVeh;
				petros directSay "SentGenBaseUnlockVehicle";
			};
			
			case CALLBACK_VEH_CUSTOM_CREATE_VEHICLE: {
				_callbackParams params ["_vehicleType", "_pos", "_dir"];
				[_vehicleType, _pos, _dir] call A3A_fnc_placeEmptyVehicle;
			};
		};
	};
	
	case "BUILDSTRUCTURE": {
		switch (_callbackType) do {
			case CALLBACK_VEH_PLACEMENT_CLEANUP: {
				build_handleDamageHandler =	player removeEventHandler ["HandleDamage", build_handleDamageHandler];
			};
		
			case CALLBACK_VEH_PLACEMENT_CANCELLED: {
				["Construction", "Construction cancelled"] call A3A_fnc_customHint;
			};
		
			case CALLBACK_SHOULD_CANCEL_PLACEMENT: {
				[false];
			};
			
			case CALLBACK_VEH_IS_VALID_LOCATION: {
				private _pos =	_callbackParams param [0];
				switch (build_type) do {
					case "RB": {
						[isOnRoad _pos, "Roadblocks can only be built on roads"];
					};
					case "SB": {
						[!(isOnRoad _pos) && _pos inArea build_nearestFriendlyMarker, "Bunkers can only be built off roads, in friendly areas"];
					};
					case "CB": {
						[!(isOnRoad _pos) && _pos inArea build_nearestFriendlyMarker, "Bunkers can only be built off roads, in friendly areas"];
					};
					default {
						[true];
					};
				};
			};
		
			case CALLBACK_CAN_PLACE_VEH: {
				[true];
			};
		
			case CALLBACK_VEH_PLACED_SUCCESSFULLY: {
				//No return needed.
			};
			
			case CALLBACK_VEH_CUSTOM_CREATE_VEHICLE: {
				_callbackParams params ["_vehicleType", "_pos", "_dir"];
				[_vehicleType, _pos, _dir] spawn A3A_fnc_buildCreateVehicleCallback;
				//Explcitly return nil. We're letting the spawned script handle building from here.
				nil;
			};
		};
	};
	
	default {
		switch (_callbackType) do {
			case CALLBACK_VEH_PLACEMENT_CLEANUP: {
				//No return needed
			};
		
			case CALLBACK_VEH_PLACEMENT_CANCELLED: {
				//No return needed
			};
		
			case CALLBACK_SHOULD_CANCEL_PLACEMENT: {
				[false];
			};
			
			case CALLBACK_VEH_IS_VALID_LOCATION: {
				[true];
			};
		
			case CALLBACK_CAN_PLACE_VEH: {
				[true];
			};
		
			case CALLBACK_VEH_PLACED_SUCCESSFULLY: {
				//No return needed.
			};
			
			case CALLBACK_VEH_CUSTOM_CREATE_VEHICLE: {
				_callbackParams params ["_vehicleType", "_pos", "_dir"];
				diag_log format ["%1 %2 %3", _vehicleType, _pos, _dir];
				[_vehicleType, _pos, _dir] call A3A_fnc_placeEmptyVehicle;
			};
		};
	};
};
