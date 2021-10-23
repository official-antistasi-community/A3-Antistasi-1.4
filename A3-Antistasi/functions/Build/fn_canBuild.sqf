/*
Maintainer: DoomMetal
    Checks if the player or an AI in the players group can build,
    and gives a reason if not.

Arguments:
    <UNIT> The unit to check if can build

Return Value:
    ARRAY<BOOL, STRING> Returns true and "" if able to build, false and reason if not

Scope: Local
Environment: Any
Public: Yes
Dependencies:
    None

Example:
    [] call A3A_fnc_canBuild; // [true, ""] or [false,"Reasons"]
*/

// TODO: Check if player is moving any HQ objects

// Check if player is already placing a vehicle or building
if (!(isNil "placingVehicle") && {placingVehicle}) exitWith {
    [false, "You cannot build while already placing something else."];
};

// Check if player is remote controlling AI
if (player != player getVariable ["owner",objNull]) exitWith {
    [false, "You cannot build while controlling AI"];
};

private _build_engineerSelected = objNull;

private _engineers = (units group player) select {_x getUnitTrait "engineer"};
private _playerIsEngineer = false;
private _otherPlayerEngineers = [];
private _aiEngineers = [];

private _result = [true, ""];

{
	if (_x getUnitTrait "engineer") then {
		if (isPlayer _x) then {
			if (player == _x) then {
				_playerIsEngineer = true;
			} else {
				_otherPlayerEngineers pushBack _x;
			};
		} else {
			//AI Engineer
			_aiEngineers pushBack _x;
		};
	};
} forEach units group player;

private _engineerIsBusy = {
	private _engineer = param [0, objNull];
	((_engineer getVariable ["helping",false])
	or (_engineer getVariable ["rearming",false])
	or (_engineer getVariable ["constructing",false]));
};

//Check if the player can build
if (_playerIsEngineer) then {
	if ([player] call A3A_fnc_canFight && !([player] call _engineerIsBusy)) then {
		_build_engineerSelected = player;
	} else {
		_result = [false, "You are an engineer, but not in a state to build: you may be unconscious or undercover."];
	};
} else {
	_result = [false, "You are not an engineer."];
};

//Check if an engineer can build.
if (isNull _build_engineerSelected && count _otherPlayerEngineers > 0) then {
	_build_engineerSelected = _otherPlayerEngineers select 0;
	_result = [false, "There is a human engineer in your squad. Ask them to build."];
};

if (isNull _build_engineerSelected) then {
	if (count _aiEngineers > 0 && player != leader player) exitWith {
		_result = [false, "Only squad leaders can order AI to build"];
	};

	{
		if ([_x] call A3A_fnc_canFight && !([_x] call _engineerIsBusy)) exitWith {
			_build_engineerSelected = _x;
			_result = [true, ""];
		};
	} forEach _aiEngineers;

	if (isNull _build_engineerSelected) exitWith {
		_result = [false, "You have no available engineers in your squad. They may be unconscious or busy."];
	};
};

if (isNull _build_engineerSelected || ((player != _build_engineerSelected) and (isPlayer _build_engineerSelected))) exitWith {
	_result;
};

_result;
