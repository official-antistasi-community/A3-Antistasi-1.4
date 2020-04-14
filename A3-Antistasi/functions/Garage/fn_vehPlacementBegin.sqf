#include "defineGarage.inc"

// vehPlace_ variables SHOULD NOT BE USED OUTSIDE OF THE GARAGE SCRIPTS
// THINGS MAY BREAK
// USE AT YOUR OWN PERIL
// Other globals are fair game.

//Params:
// - Type of vehicle: STRING
// - Name of target callback in callbacks.sqf: STRING
// - Extra message to display in menu prompt

if (!(isNil "placingVehicle") && {placingVehicle}) exitWith {["Garage", "Unable to place vehicle, already placing a vehicle"] call A3A_fnc_customHint;};
placingVehicle = true;

params ["_vehicleType", ["_callbackTarget", ""], ["_displayMessage", ""]];

vehPlace_callbackTarget = _callbackTarget;
vehPlace_extraMessage = _displayMessage;

vehPlace_previewVeh = createSimpleObject [_vehicleType ,[0,0,1000], true];
vehPlace_previewVeh allowDamage false;
vehPlace_previewVeh enableSimulation false;

[_vehicleType] call A3A_fnc_displayVehiclePlacementMessage;
["Garage", "Hover your mouse to the desired position. If it's safe and suitable, you will see the vehicle"] call A3A_fnc_customHint;

//Control flow is weird here. KeyDown tells onEachFrame it can stop running, and which action to do.
//This guarantees us no race conditions between keyDown, onEachFrame and the rest of the code.
#define KEY_SPACE 57
#define KEY_ENTER 28
#define KEY_LEFT 205
#define KEY_RIGHT 203

vehPlace_actionToAttempt = VEHPLACE_NO_ACTION;

//We define this once and never remove it
//Because removing handlers can cause the IDs other handlers to change, stopping them being removed.
if(isNil "vehPlace_keyDownHandler")	then {
	vehPlace_keyDownHandler = (findDisplay 46) displayAddEventHandler ["KeyDown", {
		if (!placingVehicle) exitWith {false;};
		private _handled = false;
		//Place vehicle
		if (_this select 1 == KEY_SPACE) then
			{
			if (vehPlace_previewVeh distance [0,0,1000] <= 1500) then
				{
				["<t size='0.6'>The current position is not suitable for the vehicle. Try another",0,0,3,0,0,4] spawn bis_fnc_dynamicText;
				}
			else 
				{
				_handled = true;
				vehPlace_actionToAttempt = VEHPLACE_ACTION_PLACE;
				};
			};
		//Exit Garage
		if (_this select 1 == KEY_ENTER) then
			{
			_handled = true;
			vehPlace_actionToAttempt = VEHPLACE_ACTION_EXIT;
			};
		//Rotate left
		if (_this select 1 == KEY_LEFT) then
			{
			_handled = true;
			vehPlace_actionToAttempt = VEHPLACE_ACTION_ROT_LEFT;
			};
		//Rotate right
		if (_this select 1 == KEY_RIGHT) then
			{
			_handled = true;
			vehPlace_actionToAttempt = VEHPLACE_ACTION_ROT_RIGHT;
			};
		_handled;
	}];
};

vehPlace_updatedLookPosition = [0,0,0];
vehPlace_lastLookPosition = [0,0,0];
addMissionEventHandler ["EachFrame",
	{
	scopeName "handler";
	private _shouldExitHandler = false;
	if (vehPlace_actionToAttempt != VEHPLACE_NO_ACTION) then 
		{
		switch(vehPlace_actionToAttempt) do 
			{
			case VEHPLACE_ACTION_PLACE: 
				{
					[] spawn A3A_fnc_attemptPlaceVehicle;
					_shouldExitHandler = true;
				};
			case VEHPLACE_ACTION_EXIT: 
				{
					[] spawn A3A_fnc_handleVehPlacementCancelled;
					_shouldExitHandler = true;
				};
			case VEHPLACE_ACTION_RELOAD: 
				{
					if (isNil "vehPlace_nextVehType") exitWith {diag_log "[Antistasi] Warning: Attempting to refresh placed vehicle, but no new type set.";};
					private _typeX = vehPlace_nextVehType;
					if !(_typeX isEqualType "") exitWith {};
					
					hideObject vehPlace_previewVeh;
					deleteVehicle vehPlace_previewVeh;				
					vehPlace_previewVeh = createSimpleObject [_typeX, [0,0,1000], true];
					vehPlace_previewVeh allowDamage false;
					vehPlace_previewVeh enableSimulation false;
					[_typeX] call A3A_fnc_displayVehiclePlacementMessage;
				};
			case VEHPLACE_ACTION_ROT_LEFT: 
				{
					vehPlace_previewVeh setDir (getDir vehPlace_previewVeh + 1);
				};
			case VEHPLACE_ACTION_ROT_RIGHT: 
				{
					vehPlace_previewVeh setDir (getDir vehPlace_previewVeh - 1);
				};
			};
			vehPlace_actionToAttempt = VEHPLACE_NO_ACTION;
		};
	
	//If we're not already exiting, then check if we need to cancel anyway
	if (!_shouldExitHandler) then {
		private _shouldCancelArray = [vehPlace_callbackTarget, CALLBACK_SHOULD_CANCEL_PLACEMENT, [vehPlace_previewVeh]] call A3A_fnc_vehPlacementCallbacks;
		if (_shouldCancelArray select 0) then {
			["Garage", (_shouldCancelArray select 1)] call A3A_fnc_customHint;
			[] spawn A3A_fnc_handleVehPlacementCancelled;
			_shouldExitHandler = true;
		};
	};
	
	if (_shouldExitHandler) exitWith {
		removeMissionEventHandler ["EachFrame", _thisEventHandler];
	};
	
	if (isNull vehPlace_previewVeh) exitWith {};
	// Get point on /terrain/ the player is looking at
	_ins = lineIntersectsSurfaces [
		AGLToASL positionCameraToWorld [0,0,0],
		AGLToASL positionCameraToWorld [0,0,1000],
		player,vehPlace_previewVeh,true,1,"NONE","NONE"
	];
	if (count _ins == 0) exitWith {};
	private _pos = ASLtoAGL ((_ins select 0) select 0);
	if (_pos distance vehPlace_lastLookPosition < 0.01) exitWith {};
	vehPlace_lastLookPosition =	_pos;

	private _placementPos = [];
	//Just use the current position, if we're in 'Precision' mode
	if (inputAction "turbo" > 0) then {
		private _validPos = _pos findEmptyPosition [0, 0, typeOf vehPlace_previewVeh];	
		if (count _validPos > 0) then {
			_placementPos = _pos;
		};
	} else {
		//Only update the position when we're looking a certain distance away from the position we were looking at when we last placed the preview.
		//Helps avoid lots of rapid, potentially large changes in position.
		if (_pos distance vehPlace_updatedLookPosition < 0.5) then {breakOut "handler";};
		//Gradually increase the search distance, to try to avoid large jumps in position.
		for "_maxDist" from 0 to 10 step 5 do {
			_placementPos =	_pos findEmptyPosition [0, _maxDist, typeOf vehPlace_previewVeh];
			if (count _placementPos > 0) exitWith {};
		};
	};
	// Make it vanish if we can't find an empty position
	if (count (_placementPos) == 0) exitWith {vehPlace_previewVeh setPosASL [0,0,0]};
	
	// Check if the current location is valid - hide the vehicle if not
	private _isValidLocationArray = [vehPlace_callbackTarget, CALLBACK_VEH_IS_VALID_LOCATION, [_placementPos, getDir vehPlace_previewVeh, typeOf vehPlace_previewVeh]] call A3A_fnc_vehPlacementCallbacks;
	if (!(_isValidLocationArray select 0)) exitWith {
		vehPlace_previewVeh setPosASL [0,0,0];
	};
	
	// If vehicle is a boat, make sure it spawns at sea level?

	_water = surfaceIsWater _placementPos;
	if (vehPlace_previewVeh isKindOf "Ship") then
	{
		_placementPos set [2,0];
		if (!water || _placementPos distance2d player > 200) exitWith {vehPlace_previewVeh setPosASL [0,0,0]};
		vehPlace_updatedLookPosition = _pos;
		vehPlace_previewVeh setPosASL _placementPos;
		vehPlace_previewVeh setVectorUp [0,0,1];
	}
	else {
		if (_water || _placementPos distance2d player > 100) exitWith {vehPlace_previewVeh setPosASL [0,0,0]};
		vehPlace_updatedLookPosition = _pos;
		vehPlace_previewVeh setPosATL _placementPos;
		vehPlace_previewVeh setVectorUp (_chosenIntersection select 1);
	};
	}];